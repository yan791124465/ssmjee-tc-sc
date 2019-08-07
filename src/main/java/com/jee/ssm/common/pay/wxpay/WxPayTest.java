package com.jee.ssm.common.pay.wxpay;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

public class WxPayTest {

    private static final Logger logger = Logger.getLogger("WxPayTest");

    public static void main(String[] args) {
        try {
            Map<String,String> param = new HashMap<>();
            param.put("total_fee","1");
            param.put("body","商户订单");
            param.put("out_trade_no","12313132132");
            param.put("spbill_create_ip","192.168.0.1");
            param.put("notify_url","https://api.mch.weixin.qq.com/pay/unifiedorder");
            param.put("product_id","");//商品ID 选传
            param.put("attach","WEB");//自定义 选传
            Map wxMap = weixin_pay(param);
            if(wxMap != null && wxMap.get("return_code").equals("SUCCESS")){
                String filePath = generatorImage(wxMap.get("code_url").toString(), "/home/gaoxiang/" + nonceStr()+".png");
                if(!filePath.isEmpty()){
                    logger.info("微信："+ wxMap +"\n二维码：" + filePath + "\nParam：" + param);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成PNG格式的二维码，只能是png格式。
     * @param urlCode 微信二维码url
     * @param filePath 文件路径
     */
    public static String generatorImage(String urlCode,String filePath){
        Boolean encode = ZxingKit.encode(urlCode, BarcodeFormat.QR_CODE, 3, ErrorCorrectionLevel.H,
                                        "png", 200, 200, filePath);
        if (encode) {
            return filePath;
        }
        return "";
    }

    /**
     * 验证参数是否完整
     * @param param
     * @return
     */
    public static boolean checkParam(Map<String,String> param){
        if(param != null && param.containsKey("total_fee")
                        && param.containsKey("body")
                        && param.containsKey("out_trade_no")
                        && param.containsKey("spbill_create_ip")
                        && param.containsKey("notify_url")){
            return true;
        }else{
            return false;
        }
    }


    public static String nonceStr(){
        String currTime = PayCommonUtil.getCurrTime();
        String strTime = currTime.substring(8, currTime.length());
        String strRandom = PayCommonUtil.buildRandom(4) + "";
        return strTime + strRandom;
    }

    /**
     * 必传参数有： price(价格),body(描述),no(订单ID ),product(商品ID ),ip(发起客户端的IP ),notify(异步回调地址)
     * attach 是附加数据，可以不传
     * @param param 订单参数
     * @return
     * @throws Exception
     */
    public static Map weixin_pay(Map<String,String> param) throws Exception {
        if(!checkParam(param)){
            logger.error("参数不全");
            return null;
        }
        SortedMap<Object,Object> packageParams = new TreeMap<Object,Object>();
        packageParams.put("appid", WxPayConfig.APP_ID);// 账号信息
        packageParams.put("mch_id", WxPayConfig.MCH_ID);// 商户
        packageParams.put("nonce_str", nonceStr()); // key
        packageParams.put("trade_type", WxPayConfig.TRADE_TYPE); //指定获取类型为二维码
        packageParams.putAll(param);
        //请求签名
        String sign = PayCommonUtil.createSign(WxPayConfig.CHARACTER, packageParams,WxPayConfig.MCH_Key);
        packageParams.put("sign", sign);
        //转换为xml格式的请求串
        String requestXML = PayCommonUtil.getRequestXml(packageParams);
        //发送请求
        String resXml = HttpUtil.postData(WxPayConfig.MCH_URL, requestXML);
        //返回内容转换为map
        Map map = XMLUtil.doXMLParse(resXml);
        return map;
        //logger.info("wxMap：" + map);
        //String return_code = (String) map.get("return_code");
        //String prepay_id = (String) map.get("prepay_id");
        //String urlCode = (String) map.get("code_url");
        //return urlCode;
    }

    public void weixin_notify(HttpServletRequest request, HttpServletResponse response) throws Exception{

        //读取参数
        InputStream inputStream ;
        StringBuffer sb = new StringBuffer();
        inputStream = request.getInputStream();
        String s ;
        BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        while ((s = in.readLine()) != null){
            sb.append(s);
        }
        in.close();
        inputStream.close();

        //解析xml成map
        Map<String, String> m = new HashMap<String, String>();
        m = XMLUtil.doXMLParse(sb.toString());

        //过滤空 设置 TreeMap
        SortedMap<Object,Object> packageParams = new TreeMap<Object,Object>();
        Iterator it = m.keySet().iterator();
        while (it.hasNext()) {
            String parameter = (String) it.next();
            String parameterValue = m.get(parameter);

            String v = "";
            if(null != parameterValue) {
                v = parameterValue.trim();
            }
            packageParams.put(parameter, v);
        }

        // 账号信息
        String key = WxPayConfig.MCH_Key; // key

        logger.info(packageParams);
        //判断签名是否正确
        if(PayCommonUtil.isTenpaySign("UTF-8", packageParams,key)) {
            //------------------------------
            //处理业务开始
            //------------------------------
            String resXml = "";
            if("SUCCESS".equals((String)packageParams.get("result_code"))){
                // 这里是支付成功
                //////////执行自己的业务逻辑////////////////
                String mch_id = (String)packageParams.get("mch_id");
                String openid = (String)packageParams.get("openid");
                String is_subscribe = (String)packageParams.get("is_subscribe");
                String out_trade_no = (String)packageParams.get("out_trade_no");

                String total_fee = (String)packageParams.get("total_fee");

                logger.info("mch_id:"+mch_id);
                logger.info("openid:"+openid);
                logger.info("is_subscribe:"+is_subscribe);
                logger.info("out_trade_no:"+out_trade_no);
                logger.info("total_fee:"+total_fee);

                //////////执行自己的业务逻辑////////////////

                logger.info("支付成功");
                //通知微信.异步确认成功.必写.不然会一直通知后台.八次之后就认为交易失败了.
                resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>"
                        + "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";

            } else {
                logger.info("支付失败,错误信息：" + packageParams.get("err_code"));
                resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
                        + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
            }
            //------------------------------
            //处理业务完毕
            //------------------------------
            BufferedOutputStream out = new BufferedOutputStream(
                    response.getOutputStream());
            out.write(resXml.getBytes());
            out.flush();
            out.close();
        } else{
            logger.info("通知签名验证失败");
        }

    }
}

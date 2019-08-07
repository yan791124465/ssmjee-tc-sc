<%--
  Created by IntelliJ IDEA.
  User: gaoxiang
  Date: 2017/3/14
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="ssm" uri="http://ssm.elangzhi.com/jsp/tag/functions" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="zh" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="zh" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>后台服务中心</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="后台服务中心"/>
    <meta content="" name="GaoXiang"/>
    <jsp:include page="../body/link-page.jsp"/>
    <style>
        p {margin:1em 0; padding:0 0 0 2em; text-indent:2em; font:normal normal 12px/2.6em "Microsoft YaHei UI";color:#000; }
    </style>
</head>
<!-- END HEAD -->
<body class="page-content-white fade-in-up">

<!-- BEGIN CONTAINER -->
<div class="page-container">
    <div class="portlet light ">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-paper-plane font-green-haze"></i>
                <span class="caption-subject bold font-green-haze uppercase"> 后台服务中心 </span>
                <span class="caption-helper">精彩人生，你我共勉！</span>
            </div>
            <div class="actions">
                <div class="portlet-input input-inline input-medium">
                    <div class="input-group">
                        <input type="text" class="form-control input-circle-left" placeholder="search...">
                        <span class="input-group-btn">
                                    <button class="btn btn-circle-right btn-default" type="submit">Go!</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="portlet-body">

            <div class="note note-success">
                <h4 class="block">一日之计在于晨</h4>
                <p> 俗语，告诉人们叫珍惜时间。早上的确应该是我们精力最充沛的时刻，因为经过一个晚上的休息调整，状态应该达到最佳，所谓“好的开始是成功的一半”，对接下去一天要做的事情满怀希望和信心，过去的一天已经过去了，已经告一段落。就算有什么不顺心的事情也不要让它影响到我们的心情，今天又是崭新的一天，会有不一样的收获。在每个早晨醒来的时候都要给自己一个这样的积极的心理暗示，对我们的工作和都是有很大帮助的。 </p>
            </div>

            <div class="note note-info">
                <h4 class="block">一年之计在于春</h4>
                <p> 一年之计在于春，这句话是中国劳动人民在千百年的生产实践中总结出来的一条经验，它强调了春在一年四季中所占的重要位置。意指一年的计划要在春天考虑安排。比喻凡事要早做打算，开头就要抓紧。要在一年（或一天）开始时多做并做好工作，为全年（或全天）的工作打好基础。而且古今中外许多文人墨客对春的赞美诗更是比比皆是，人们还将人的年轻时期称为“青春”，歌颂春的创造力，强调春的宝贵。 </p>
                <p> 一年之计在于春，体现了只有在春天辛勤劳动才能获得丰收，一日之计在于晨，也体现出了早晨的宝贵。两句都比喻人生需要珍惜时间。 </p>
            </div>

            <div class="note note-danger">
                <h4 class="block">一生之计在于勤</h4>
                <p> 治生之道，莫尚乎勤。故邵子云：“一日之计在于晨，一岁之计在于春，一生之计在于勤。”言虽近而旨则远。无如人之常情，恶劳而好逸，甘食愉衣，玩日愒岁。以之为农，则不能深耕而易耨；以之为工，则不能计日而见功；以之为商，则不能乘时而趋利；以之为士，则不能笃志力行。徒然食息于天地之间，是一蠹耳！夫天地之化，日新则不敝，故户枢不蠹，流水不腐，诚不欲其常安也。人之心与力，何独不然？劳则思，逸则忘，物情也。大禹之圣，且惜寸阴，陶侃之贤，且惜分阴，又况圣贤不若彼者乎？ </p>
            </div>

            <div class="note note-warning">
                <h4 class="block">陋室铭</h4>
                <p> 山不在高， 有仙则名。 水不在深， 有龙则灵。 斯是陋室， 惟吾德馨。 苔痕上阶绿， 草色入帘青。 谈笑有鸿儒， 往来无白丁。 可以调素琴， 阅金经。 无丝竹之乱耳， 无案牍之劳形。 南阳诸葛庐， 西蜀子云亭。 孔子云： 何陋之有？ </p>
            </div>
        </div>
    </div>
</div>
<!-- END CONTENT -->

<!-- BEGIN PAGE JAVASCRIPT-->
<jsp:include page="../body/javascript-page.jsp"/>
<script>

    $(document).ready(function () {

    });

</script>
<!-- END PAGE JAVASCRIPT-->
</body>
</html>









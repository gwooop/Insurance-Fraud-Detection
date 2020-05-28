// 윈도우 로드시 보험 사기 금액 추이 보여주는 그래프 
window.onload = function(){
   am4core.ready(function() {
      
      $("#chartText").append("연도별 보험사기 피해 금액")
      $("#chartContent").append("(현황) ’19년 중 보험사기 적발금액은 8,809억원으로 전년(7,982억원) 대비 827억원(10.4%↑) 증가한 역대 최고 수준  -보험사기 대응단-")
      $("#selectArea").css("display","none");
      $("#selectArea2").css("display","none");
        // Themes begin
        am4core.useTheme(am4themes_animated);
        // Themes end

        // Create chart instance
        var chart = am4core.create("chartdiv", am4charts.XYChart);

        // Export
        chart.exporting.menu = new am4core.ExportMenu();

        chart.legend = new am4charts.Legend();
        chart.legend.position = "end";   
        // Data for both series
        var data = [ {
          "year": "2015년",
          "적발금액(억원)": 6.548,
          "1인당 적발금액(백만원)": 7.8
        }, {
          "year": "2016년",
          "적발금액(억원)": 7.185,
          "1인당 적발금액(백만원)": 8.7
        }, {
          "year": "2017년",
          "적발금액(억원)": 7.302,
          "1인당 적발금액(백만원)": 8.7
        }, {
          "year": "2018년",
          "적발금액(억원)": 7.982,
          "1인당 적발금액(백만원)": 10.1
        }, {
          "year": "2019년",
          "적발금액(억원)": 8.809,
          "1인당 적발금액(백만원)": 9.5,
          "lineDash": "5,5",
        }];

        /* Create axes */
        var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
        categoryAxis.dataFields.category = "year";
        categoryAxis.renderer.minGridDistance = 30;

        /* Create value axis */
        var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

        /* Create series */
        var columnSeries = chart.series.push(new am4charts.ColumnSeries());
        columnSeries.name = "적발금액(억원)";
        columnSeries.dataFields.valueY = "적발금액(억원)";
        columnSeries.dataFields.categoryX = "year";

        columnSeries.columns.template.tooltipText = "[#fff font-size: 15px] {categoryX} {name}:\n[/][#fff font-size: 20px]{valueY}[/] [#fff]{additional}[/]"
        columnSeries.columns.template.propertyFields.fillOpacity = "fillOpacity";
        columnSeries.columns.template.propertyFields.stroke = "stroke";
        columnSeries.columns.template.propertyFields.strokeWidth = "strokeWidth";
        columnSeries.columns.template.propertyFields.strokeDasharray = "columnDash";
        columnSeries.tooltip.label.textAlign = "middle";
        columnSeries.fill = am4core.color("#8181F7");
        
        var lineSeries = chart.series.push(new am4charts.LineSeries());
        lineSeries.name = "1인당 적발금액(백만원)";
        lineSeries.dataFields.valueY = "1인당 적발금액(백만원)";
        lineSeries.dataFields.categoryX = "year";

        lineSeries.stroke = am4core.color("#fdd400");
        lineSeries.strokeWidth = 3;
        lineSeries.propertyFields.strokeDasharray = "lineDash";
        lineSeries.tooltip.label.textAlign = "middle";

        var bullet = lineSeries.bullets.push(new am4charts.Bullet());
        bullet.fill = am4core.color("#fdd400"); // tooltips grab fill from parent by default
        bullet.tooltipText = "[#fff font-size: 15px]{categoryX} {name}:\n[/][#fff font-size: 20px]{valueY}[/] [#fff]{additional}[/]"
        var circle = bullet.createChild(am4core.Circle);
        circle.radius = 4;
        circle.fill = am4core.color("#fff");
        circle.strokeWidth = 3;

        chart.data = data;
        
        }); // end am4core.ready()
   
//년도별 사기자 인구 수
    am4core.ready(function() {
      $("#chartText_sub").append(" 사기자 인구수")
      $("#chartContent_sub").append("적발 인원은 92,538명으로 ‘15년 이후 정체․감소추세를 보이다가‘19년 중 크게 증가(13,359명, 16.9%↑)")
        // Themes begin
        am4core.useTheme(am4themes_animated);
        // Themes end

        // Create chart instance
        var chart = am4core.create("chartdiv_sub", am4charts.XYChart);

        // Export
        chart.exporting.menu = new am4core.ExportMenu();

        chart.legend = new am4charts.Legend();
        chart.legend.position = "end";   
        // Data for both series
        var data = [ {
          "year": "2015년",
          "적발인원(만명)": 8.3 
     
        }, {
          "year": "2016년",
          "적발인원(만명)": 8.3 
     
        }, {
          "year": "2017년",
          "적발인원(만명)": 8.3 
 
        }, {
          "year": "2018년",
          "적발인원(만명)": 7.9 

        }, {
          "year": "2019년",
          "적발인원(만명)": 9.3
        }];

        /* Create axes */
        var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
        categoryAxis.dataFields.category = "year";
        categoryAxis.renderer.minGridDistance = 30;

        /* Create value axis */
        var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

        /* Create series */
        var columnSeries = chart.series.push(new am4charts.ColumnSeries());
        columnSeries.name = "적발인원(만명)";
        columnSeries.dataFields.valueY = "적발인원(만명)";
        columnSeries.dataFields.categoryX = "year";
        columnSeries.fill = am4core.color("#8181F7");
        
        columnSeries.columns.template.tooltipText = "[#fff font-size: 15px] {categoryX} {name}:\n[/][#fff font-size: 20px]{valueY}[/] [#fff]{additional}[/]"
        columnSeries.columns.template.propertyFields.fillOpacity = "fillOpacity";
        columnSeries.columns.template.propertyFields.stroke = "stroke";
        columnSeries.columns.template.propertyFields.strokeWidth = "strokeWidth";
        columnSeries.columns.template.propertyFields.strokeDasharray = "columnDash";
        columnSeries.tooltip.label.textAlign = "middle";
        chart.data = data;

        }); // end am4core.ready()
   
   
   }
// 클라우드 태크 클릭스 보여줄 스크립트 코드
$("#cloudTag").hover(function(){
   $("html").css("cursor","pointer");
   },function(){
   $("html").css("cursor","auto");
   })
$("#cloudTag").on("click",function(){
   $("#chart1").css("height","");
   $("#selectArea").css("display","none");
     $("#selectArea2").css("display","none");
     $("#chart2").css("display","none");
     $("#chart3").css("display","none");
     $("#chart4").css("display","none");
     $("#chart5").css("display","none");
     $("#chart1").css("height","");
     emptyContent(1);
     
     var text = $("<h2> 머신러닝 모델링에서 중요도가 높은 변수 </h2><hr>")
     $("#chartText").append(text)
   am4core.ready(function() {
      
      // Themes begin
      am4core.useTheme(am4themes_animated);
      am4core.disposeAllCharts();
      // Themes end


      var chart = am4core.create("chartdiv", am4plugins_wordCloud.WordCloud);
      var series = chart.series.push(new am4plugins_wordCloud.WordCloudSeries());

      series.accuracy = 4;
      series.step = 15;
      series.rotationThreshold = 0.7;
      series.maxCount = 200;
      series.minWordLength = 2;
      series.labels.template.margin(4,4,4,4);
      series.maxFontSize = am4core.percent(30);

      series.text = "의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사" +
      		"병원 의사X병원 의사X병원 의사X병원 의사X병원 의사 의사 의사 의사 의사 의사 의사 의사 의사 의사 의사 의사 의사 의사 의사 의사 의사 의사 의사 의사 의사 의사 의사 병원 병원 병원 병원 병원 병원 병원 병원 병원 병원 병원 병원 병원 병원 병원 병원 입원일수 입원일수 입원일수 입원일수 입원일수 입원일수 입원일수 입원일수 청구횟수 청구횟수 청구횟수 질병X입원 질병X입원 재해 재해 질병 질병 총보험료 최대보험료 나이 재해X입원 주택가격 유의병원 가구소득 교통재해 아파트 고객소득 기타직군 경기도 전라북도 남자 교통재해X입원 자녀연령 자녀수 재해X통원 재해X진단 질병X수술 제조업" +
      		"여자 질병X통원 전문직 광주광역시 서비스 다가구주택 전라남도 단독주택 경상남도 재해X수술 부산 연립다가구주택 기혼 서울 배우자주부 미혼 비거주용건물 사무직 배우자서비스 주부 배우자사무직 서비스 전남 배우자자영업 제조업 아이수 여성 남성 서울 주부 재해x수술 재해x사망 교통x수술 1차산업 대전 경북 광주 서울 "+ 
      		"X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X병원 의사X" ;

      series.colors = new am4core.ColorSet();
      series.colors.passOptions = {}; // makes it loop

      //series.labelsContainer.rotation = 45;
      series.angles = [0,-90];
      series.fontWeight = "700"

      var changeEvent = setInterval(function () {
        series.dataItems.getIndex(Math.round(Math.random() * (series.dataItems.length - 1))).setValue("value", Math.round(Math.random() * 10));
       }, 10000)
      clearInterval(changeEvent)
      }); // end am4core.ready()
   
})

//  나이 버튼 클릭시 보여줄 스크립트 코드
    $("#agebtn").hover(function(){
          $('html').css("cursor","pointer");
      },function(){
         $('html').css("cursor","auto");
      })
      
      
        $("#agebtn").on("click",function(){
           // chartdiv 에 들어갈 값들
           
           am4core.ready(function() {
           am4core.disposeAllCharts();
           $("#chartText").empty()
           $("#chartContent").empty()
           $("#chartdiv").empty()              
           $("#chartText").append("사기자의 연령별 분포")
           $("#selectArea").css("display","none");
           $("#selectArea2").css("display","none");
           $("#chart1").css("height","");
           $("#chart2").css("display","block");
     
           
           
           // Themes begins
           am4core.useTheme(am4themes_animated);
           // Themes end

           var chart = am4core.create("chartdiv", am4charts.PieChart3D);
           chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

           chart.data = [
             {
               country: "50대",
               litres: 584
             },
             {
               country: "40대",
               litres: 398
             },
             {
               country: "30대",
               litres: 340
             },
             {
               country: "60대",
               litres: 277
             },
             {
               country: "20대",
               litres: 148
             },
             {
               country: "10대",
               litres: 32
             },
             {
               country: "70대",
               litres:  24
              },
              {
                country: "영유아",
                litres:  3
              }
              
           ];

           chart.innerRadius = am4core.percent(40);
           chart.depth = 120;

           chart.legend = new am4charts.Legend();

           var series = chart.series.push(new am4charts.PieSeries3D());
           series.dataFields.value = "litres";
           series.dataFields.depthValue = "litres";
           series.dataFields.category = "country";
           series.slices.template.cornerRadius = 5;
           series.colors.step = 3;
           

           });// end am4core.ready()
         emptyContent(2);
         $("#chartText_sub").append("사기자의 연령별 성비")   
         am4core.ready(function() {
              
         // Themes begin
         am4core.useTheme(am4themes_animated);
         // Themes end
         
         // Create chart instance
         var chart = am4core.create("chartdiv_sub", am4charts.XYChart3D);
         chart.legend = new am4charts.Legend();
           chart.legend.position = "end";   
         // Add data
         chart.data = [{
             "age": "애기들",
             "남자": 0.001107,
             "여자": 0.000554
         }, {
             "age": "10대",
             "남자": 0.009413,
             "여자": 0.008306
         }, {
             "age": "20대",
             "남자": 0.038206,
             "여자": 0.043743
         }, {
             "age": "30대",
             "남자": 0.091916,
             "여자": 0.096346
         }, {
             "age": "40대",
             "남자": 0.084718,
             "여자": 0.135659
         }, {
             "age": "50대",
             "남자": 0.084164,
             "여자": 0.239203
         }, {
             "age": "60대",
             "남자": 0.047065,
             "여자": 0.106312
         }, {
             "age": "70대",
             "남자": 0.003876,
             "여자": 0.009413
         }];
         
         // Create axes
         var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
         categoryAxis.dataFields.category = "age";
         categoryAxis.renderer.grid.template.location = 0;
         categoryAxis.renderer.minGridDistance = 30;
         
         var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
         valueAxis.title.text = "성별/전체";
         valueAxis.renderer.labels.template.adapter.add("text", function(text) {
           return Math.floor(text*100) + "%";
         });
         
         // Create series
         var series = chart.series.push(new am4charts.ColumnSeries3D());
         series.dataFields.valueY = "남자";
         series.dataFields.categoryX = "age";
         series.name = "남자";
         series.clustered = false;
         series.columns.template.tooltipText = "남자 {category} (나이): [bold]{valueY}[/]";
         series.columns.template.fillOpacity = 0.9;
         series.fill = am4core.color("rgb(103, 148, 220)");
         var series2 = chart.series.push(new am4charts.ColumnSeries3D());
         series2.dataFields.valueY = "여자";
         series2.dataFields.categoryX = "age";
         series2.name = "여자";
         series2.clustered = false;
         series2.columns.template.tooltipText = "여자 {category} (나이): [bold]{valueY}[/]";
         series2.fill = am4core.color("#FA5882");
         }); // end am4core.ready()

           
           
           /*일반인들의 직업 분포표*/
         $("#chart3").css("display","block");
         $("#selectArea").css("display","block");
         am4core.ready(function() {
           
           $("#chartText_sub2").empty()
           $("#chartContent_sub2").empty()
           $("#chartText_sub2").append("일반인의 직업 분포도")
           am4core.useTheme(am4themes_animated);
           // Themes end

           var container = am4core.create("chartdiv_sub2", am4core.Container);
           container.width = am4core.percent(100);
           container.height = am4core.percent(90);
           container.layout = "horizontal";


           var chart = container.createChild(am4charts.PieChart);
         chart.legend = new am4charts.Legend();
           chart.legend.position = "end";   
           // Add data
           
        
           
           
        
              
              
           nomal_data1 = [{
                "job": "기타",
                "litres": 4226,
                "subData": [{ name: "남자", value: 2405 }, { name: "여자", value: 1821 }]
              }, {
                "job": "주부",
                "litres": 3904,
                "subData": [{ name: "남자", value: 15 }, { name: "여자", value: 3889 }]
              }, {
                "job": "사무직",
                "litres": 2824,
                "subData": [{ name: "남자", value: 1758 }, { name: "여자", value: 1066 }]
              }, {
                "job": "서비스",
                "litres": 2302,
                "subData": [{ name: "남자", value: 1144 }, { name: "여자", value: 1158 }]
              }, {
                "job": "자영업",
                "litres": 1808,
                "subData": [{ name: "남자", value: 776 }, { name: "여자", value: 1032 }]
              }, {
                "job": "전문직",
                "litres": 1711,
                "subData": [{ name: "남자", value: 668 }, { name: "여자", value: 1043 }]
              },{
                "job": "제조업",
                "litres": 1214,
                "subData": [{ name: "남자", value: 1021 }, { name: "여자", value: 193 }]
              }, {
                "job": "1차산업",
                "litres": 300,
                "subData": [{ name: "남자", value: 221 }, { name: "여자", value: 79 }]
              }, {
                "job": "무응답",
                "litres": 512,
                "subData": [{ name: "남자", value: 302 }, { name: "여자", value: 210 }]
              }];
           nomal_data2 = [{
                "job": "기타",
                "litres": 288,
                "subData": [{ name: "남자", value: 140 }, { name: "여자", value: 148 }]
              }, {
                "job": "주부",
                "litres": 498,
                "subData": [{ name: "남자", value: 0 }, { name: "여자", value: 498 }]
              }, {
                "job": "사무직",
                "litres": 258,
                "subData": [{ name: "남자", value: 174 }, { name: "여자", value: 84 }]
              }, {
                "job": "서비스",
                "litres": 263,
                "subData": [{ name: "남자", value: 101 }, { name: "여자", value: 162 }]
              }, {
                "job": "자영업",
                "litres": 301,
                "subData": [{ name: "남자", value: 127 }, { name: "여자", value: 174 }]
              }, {
                "job": "전문직",
                "litres": 97,
                "subData": [{ name: "남자", value: 38 }, { name: "여자", value: 59 }]
              },{
                "job": "제조업",
                "litres": 54,
                "subData": [{ name: "남자", value: 46 }, { name: "여자", value: 8 }]
              }, {
                "job": "1차산업",
                "litres": 12,
                "subData": [{ name: "남자", value: 11 }, { name: "여자", value: 1 }]
              }, {
                "job": "무응답",
                "litres": 35,
                "subData": [{ name: "남자", value: 14 }, { name: "여자", value: 21 }]
              }]
           
           chart.data = nomal_data1
           $("#test").off().on("change",function(){
              var select = document.getElementById("test");
              var option_value = select.options[select.selectedIndex].value;
              var option_text   = select.options[select.selectedIndex].text;
              if(option_value ==1){
             	 $("#chartText_sub2").empty()
                 fadeEvent(2);
                 $("#chartText_sub2").append("일반인의 직업 분포도");
    
              }else{
            	 $("#chartText_sub2").empty()
            	 fadeEvent(2);
                 $("#chartText_sub2").append("사기자의 직업 분포도")
                 
              }
              
              
              selectDataset(option_value)
           })
           
           function selectDataset(set) {
             if(set == 1){
              chart.data = nomal_data1;
             }else{
              chart.data = nomal_data2; 
             }
             
           }
           // Add and configure Series
           var pieSeries = chart.series.push(new am4charts.PieSeries());
           pieSeries.dataFields.value = "litres";
           pieSeries.dataFields.category = "job";
           pieSeries.slices.template.states.getKey("active").properties.shiftRadius = 0;
           pieSeries.labels.template.text = "[#3F51B5 font-size: 15px blod] {category}\n{value.percent.formatNumber('#.#')}%";
           pieSeries.slices.template.events.on("hit", function(event) {
             selectSlice(event.target.dataItem);
           })

           var chart2 = container.createChild(am4charts.PieChart);
           chart2.width = am4core.percent(30);
           chart2.radius = am4core.percent(80);

           // Add and configure Series
           var pieSeries2 = chart2.series.push(new am4charts.PieSeries());
           pieSeries2.dataFields.value = "value";
           pieSeries2.dataFields.category = "name";
           pieSeries2.slices.template.states.getKey("active").properties.shiftRadius = 0;
           pieSeries2.labels.template.radius = am4core.percent(50);
           pieSeries2.labels.template.inside = true;
           pieSeries2.labels.template.fill = am4core.color("#3F51B5");
           pieSeries2.labels.template.disabled = false;
           pieSeries2.ticks.template.disabled = true;
           pieSeries2.labels.template.text = "[#3F51B5 font-size: 15px blod] {category}\n{value.percent.formatNumber('#.#')}%";
           pieSeries2.events.on("positionchanged", updateLines);

           var interfaceColors = new am4core.InterfaceColorSet();

           var line1 = container.createChild(am4core.Line);
           line1.strokeDasharray = "2,2";
           line1.strokeOpacity = 0.5;
           line1.stroke = interfaceColors.getFor("alternativeBackground");
           line1.isMeasured = false;

           var line2 = container.createChild(am4core.Line);
           line2.strokeDasharray = "2,2";
           line2.strokeOpacity = 0.5;
           line2.stroke = interfaceColors.getFor("alternativeBackground");
           line2.isMeasured = false;

           var selectedSlice;

           function selectSlice(dataItem) {

             selectedSlice = dataItem.slice;

             var fill = selectedSlice.fill;

             var count = dataItem.dataContext.subData.length;
             pieSeries2.colors.list = [];
             for (var i = 0; i < count; i++) {
               pieSeries2.colors.list.push(fill.brighten(i * 2 / count));
             }

             chart2.data = dataItem.dataContext.subData;
             pieSeries2.appear();

             var middleAngle = selectedSlice.middleAngle;
             var firstAngle = pieSeries.slices.getIndex(0).startAngle;
             var animation = pieSeries.animate([{ property: "startAngle", to: firstAngle - middleAngle }, { property: "endAngle", to: firstAngle - middleAngle + 360 }], 600, am4core.ease.sinOut);
             animation.events.on("animationprogress", updateLines);

             selectedSlice.events.on("transformed", updateLines);

           //  var animation = chart2.animate({property:"dx", from:-container.pixelWidth / 2, to:0}, 2000, am4core.ease.elasticOut)
           //  animation.events.on("animationprogress", updateLines)
           }


           function updateLines() {
             if (selectedSlice) {
               var p11 = { x: selectedSlice.radius * am4core.math.cos(selectedSlice.startAngle), y: selectedSlice.radius * am4core.math.sin(selectedSlice.startAngle) };
               var p12 = { x: selectedSlice.radius * am4core.math.cos(selectedSlice.startAngle + selectedSlice.arc), y: selectedSlice.radius * am4core.math.sin(selectedSlice.startAngle + selectedSlice.arc) };

               p11 = am4core.utils.spritePointToSvg(p11, selectedSlice);
               p12 = am4core.utils.spritePointToSvg(p12, selectedSlice);

               var p21 = { x: 0, y: -pieSeries2.pixelRadius };
               var p22 = { x: 0, y: pieSeries2.pixelRadius };

               p21 = am4core.utils.spritePointToSvg(p21, pieSeries2);
               p22 = am4core.utils.spritePointToSvg(p22, pieSeries2);

               line1.x1 = p11.x;
               line1.x2 = p21.x;
               line1.y1 = p11.y;
               line1.y2 = p21.y;

               line2.x1 = p12.x;
               line2.x2 = p22.x;
               line2.y1 = p12.y;
               line2.y2 = p22.y;
             }
           }
           

           chart.events.on("datavalidated", function() {
             setTimeout(function() {
               selectSlice(pieSeries.dataItems.getIndex(0));
             }, 1000);
             
              });
         })
         $("#chart4").css("display","block");
         $("#selectArea").css("display","block");
         am4core.ready(function() {
           
           $("#chartContent_sub3").empty()
           $("#chartText_sub3").empty()
           $("#chartText_sub3").append("일반인 40~50대 직업 분포도")
           $("#selectArea2").css("display","block");
           am4core.useTheme(am4themes_animated);
           // Themes end

           var container = am4core.create("chartdiv_sub3", am4core.Container);
           container.width = am4core.percent(100);
           container.height = am4core.percent(90);
           container.layout = "horizontal";


           var chart = container.createChild(am4charts.PieChart);
         chart.legend = new am4charts.Legend();
           chart.legend.position = "end";   
           // Add data
           
        
           
           
        
              
              
           data1 = [{
                "job": "기타",
                "litres": 232,
                "subData": [{ name: "남자", value: 115 }, { name: "여자", value: 117 }]
              }, {
                "job": "주부",
                "litres": 2366,
                "subData": [{ name: "남자", value: 15 }, { name: "여자", value: 2364 }]
              }, {
                "job": "사무직",
                "litres": 1411,
                "subData": [{ name: "남자", value: 973 }, { name: "여자", value: 438 }]
              }, {
                "job": "서비스",
                "litres": 1440,
                "subData": [{ name: "남자", value: 701 }, { name: "여자", value: 739 }]
              }, {
                "job": "자영업",
                "litres": 1091,
                "subData": [{ name: "남자", value: 427 }, { name: "여자", value: 664 }]
              }, {
                "job": "전문직",
                "litres": 955,
                "subData": [{ name: "남자", value: 410 }, { name: "여자", value: 545 }]
              },{
                "job": "제조업",
                "litres": 760,
                "subData": [{ name: "남자", value: 637 }, { name: "여자", value: 123 }]
              }, {
                "job": "1차산업",
                "litres": 131,
                "subData": [{ name: "남자", value: 99 }, { name: "여자", value: 32 }]
              }, {
                "job": "무응답",
                "litres": 249,
                "subData": [{ name: "남자", value: 163 }, { name: "여자", value: 86 }]
              }];
           data2 = [{
                "job": "기타",
                "litres": 25   ,
                "subData": [{ name: "남자", value: 13 }, { name: "여자", value: 12 }]
              }, {
                "job": "주부",
                "litres": 345,
                "subData": [{ name: "남자", value: 0 }, { name: "여자", value: 345 }]
              }, {
                "job": "사무직",
                "litres": 136,
                "subData": [{ name: "남자", value: 95 }, { name: "여자", value: 41 }]
              }, {
                "job": "서비스",
                "litres": 167,
                "subData": [{ name: "남자", value: 60 }, { name: "여자", value: 107 }]
              }, {
                "job": "자영업",
                "litres": 201,
                "subData": [{ name: "남자", value: 80 }, { name: "여자", value: 121 }]
              }, {
                "job": "전문직",
                "litres": 55,
                "subData": [{ name: "남자", value: 19 }, { name: "여자", value: 36 }]
              },{
                "job": "제조업",
                "litres": 30,
                "subData": [{ name: "남자", value: 27 }, { name: "여자", value: 3 }]
              }, {
                "job": "1차산업",
                "litres": 4,
                "subData": [{ name: "남자", value: 3 }, { name: "여자", value: 1 }]
              }, {
                "job": "무응답",
                "litres": 19,
                "subData": [{ name: "남자", value: 8 }, { name: "여자", value: 11 }]
              }]
           
           chart.data = data1
           $("#test2").off().on("change",function(){
              var select = document.getElementById("test2");
              var option_value = select.options[select.selectedIndex].value;
              var option_text   = select.options[select.selectedIndex].text;
              if(option_value ==1){
                 $("#chartText_sub3").empty()
                 fadeEvent(3);
                 $("#chartText_sub3").append("일반인 40~50대 직업 분포도")
              }else{
                 $("#chartText_sub3").empty()
                 fadeEvent(3);
                 $("#chartText_sub3").append("사기자 40~50대  직업 분포도")
                 
              }
              
              
              selectDataset(option_value)
           })
           
           function selectDataset(set) {
             if(set == 1){
              chart.data = data1;
             }else{
              chart.data = data2; 
             }
             
           }
           // Add and configure Series
           var pieSeries = chart.series.push(new am4charts.PieSeries());
           pieSeries.dataFields.value = "litres";
           pieSeries.dataFields.category = "job";
           pieSeries.slices.template.states.getKey("active").properties.shiftRadius = 0;
           pieSeries.labels.template.text = "[#3F51B5 font-size: 15px blod] {category}\n{value.percent.formatNumber('#.#')}%";
           pieSeries.slices.template.events.on("hit", function(event) {
             selectSlice(event.target.dataItem);
           })

           var chart2 = container.createChild(am4charts.PieChart);
           chart2.width = am4core.percent(30);
           chart2.radius = am4core.percent(80);

           // Add and configure Series
           var pieSeries2 = chart2.series.push(new am4charts.PieSeries());
           pieSeries2.dataFields.value = "value";
           pieSeries2.dataFields.category = "name";
           pieSeries2.slices.template.states.getKey("active").properties.shiftRadius = 0;
           pieSeries2.labels.template.radius = am4core.percent(50);
           pieSeries2.labels.template.inside = true;
           pieSeries2.labels.template.fill = am4core.color("#3F51B5");
           pieSeries2.labels.template.disabled = false;
           pieSeries2.ticks.template.disabled = true;
           pieSeries2.labels.template.text = "[#3F51B5 font-size: 15px blod] {category}\n{value.percent.formatNumber('#.#')}%";
           pieSeries2.events.on("positionchanged", updateLines);

           var interfaceColors = new am4core.InterfaceColorSet();

           var line1 = container.createChild(am4core.Line);
           line1.strokeDasharray = "2,2";
           line1.strokeOpacity = 0.5;
           line1.stroke = interfaceColors.getFor("alternativeBackground");
           line1.isMeasured = false;

           var line2 = container.createChild(am4core.Line);
           line2.strokeDasharray = "2,2";
           line2.strokeOpacity = 0.5;
           line2.stroke = interfaceColors.getFor("alternativeBackground");
           line2.isMeasured = false;

           var selectedSlice;

           function selectSlice(dataItem) {

             selectedSlice = dataItem.slice;

             var fill = selectedSlice.fill;

             var count = dataItem.dataContext.subData.length;
             pieSeries2.colors.list = [];
             for (var i = 0; i < count; i++) {
               pieSeries2.colors.list.push(fill.brighten(i * 2 / count));
             }

             chart2.data = dataItem.dataContext.subData;
             pieSeries2.appear();

             var middleAngle = selectedSlice.middleAngle;
             var firstAngle = pieSeries.slices.getIndex(0).startAngle;
             var animation = pieSeries.animate([{ property: "startAngle", to: firstAngle - middleAngle }, { property: "endAngle", to: firstAngle - middleAngle + 360 }], 600, am4core.ease.sinOut);
             animation.events.on("animationprogress", updateLines);

             selectedSlice.events.on("transformed", updateLines);

           //  var animation = chart2.animate({property:"dx", from:-container.pixelWidth / 2, to:0}, 2000, am4core.ease.elasticOut)
           //  animation.events.on("animationprogress", updateLines)
           }


           function updateLines() {
             if (selectedSlice) {
               var p11 = { x: selectedSlice.radius * am4core.math.cos(selectedSlice.startAngle), y: selectedSlice.radius * am4core.math.sin(selectedSlice.startAngle) };
               var p12 = { x: selectedSlice.radius * am4core.math.cos(selectedSlice.startAngle + selectedSlice.arc), y: selectedSlice.radius * am4core.math.sin(selectedSlice.startAngle + selectedSlice.arc) };

               p11 = am4core.utils.spritePointToSvg(p11, selectedSlice);
               p12 = am4core.utils.spritePointToSvg(p12, selectedSlice);

               var p21 = { x: 0, y: -pieSeries2.pixelRadius };
               var p22 = { x: 0, y: pieSeries2.pixelRadius };

               p21 = am4core.utils.spritePointToSvg(p21, pieSeries2);
               p22 = am4core.utils.spritePointToSvg(p22, pieSeries2);

               line1.x1 = p11.x;
               line1.x2 = p21.x;
               line1.y1 = p11.y;
               line1.y2 = p21.y;

               line2.x1 = p12.x;
               line2.x2 = p22.x;
               line2.y1 = p12.y;
               line2.y2 = p22.y;
             }
           }
           

           chart.events.on("datavalidated", function() {
             setTimeout(function() {
               selectSlice(pieSeries.dataItems.getIndex(0));
             }, 1000);
             
              });
         })
        });
   
// claim 버튼을 누룰 시 작용되는 그래프들 
$("#claimBtn").hover(function(){
          $('html').css("cursor","pointer");
      },function(){
         $('html').css("cursor","auto");
      })   
$("#claimBtn").on("click",function(){
   // 1.첫번쨰 사기 유형 
      $("#chartText").empty()
        $("#chartContent").empty()
        $("#chartdiv").empty()
      $("#chart2").css("display","block");
      $("#chart1").css("height","");
        am4core.disposeAllCharts();
      am4core.ready(function() {
         $("#chartText").append("사기자의 사고 유형")
         // Themes begin
         am4core.useTheme(am4themes_animated);
         // Themes end

         // Create chart instance
         var chart = am4core.create("chartdiv", am4charts.PieChart);

         // Add and configure Series
         var pieSeries = chart.series.push(new am4charts.PieSeries());
         pieSeries.dataFields.value = "litres";
         pieSeries.dataFields.category = "사고구분";

         // Let's cut a hole in our Pie chart the size of 30% the radius
         chart.innerRadius = am4core.percent(30);

         // Put a thick white border around each Slice
         pieSeries.slices.template.stroke = am4core.color("#fff");
         pieSeries.slices.template.strokeWidth = 2;
         pieSeries.slices.template.strokeOpacity = 1;
         pieSeries.slices.template
           // change the cursor on hover to make it apparent the object can be interacted with
           .cursorOverStyle = [
             {
               "property": "cursor",
               "value": "pointer"
             }
           ];

         pieSeries.alignLabels = false;
         pieSeries.labels.template.bent = true;
         pieSeries.labels.template.radius = 3;
         pieSeries.labels.template.padding(0,0,0,0);
         pieSeries.colors.list = [
              am4core.color("#FF9671"),
              am4core.color("#FFC75F"),
              am4core.color("#F9F871"),
            ];
         pieSeries.ticks.template.disabled = true;

         // Create a base filter effect (as if it's not there) for the hover to return to
         var shadow = pieSeries.slices.template.filters.push(new am4core.DropShadowFilter);
         shadow.opacity = 0;

         // Create hover state
         var hoverState = pieSeries.slices.template.states.getKey("hover"); // normally we have to create the hover state, in this case it already exists

         // Slightly shift the shadow and make it more prominent on hover
         var hoverShadow = hoverState.filters.push(new am4core.DropShadowFilter);
         hoverShadow.opacity = 0.7;
         hoverShadow.blur = 5;

         // Add a legend
         chart.legend = new am4charts.Legend();

         chart.data = [{
           "사고구분": "질병",
           "litres": 16172
         },{
           "사고구분": "재해",
           "litres": 6168
         }, {
           "사고구분": "교통재해",
           "litres": 2224
         }];

      }); // end am4core.ready()
      // 두번쨰 청구사유 코드
      emptyContent(2);
      $("#chartText_sub").append("청구사유 분포")
        am4core.ready(function() {

           // Themes begin
         am4core.useTheme(am4themes_animated);
         // Themes end
         
         // Create chart instance
         var chart = am4core.create("chartdiv_sub", am4charts.XYChart3D);
         
         chart.legend = new am4charts.Legend();
           chart.legend.position = "end";   
         // Add data
         chart.data = [{
             "청구사유": "사망",
             "사기자": 0.001466,
             "일반인": 0.005855
         }, {
             "청구사유": "입원",
             "사기자": 0.774792,
             "일반인": 0.455093
         }, {
             "청구사유": "통원",
             "사기자": 0.073359,
             "일반인": 0.239606
         }, {
             "청구사유": "장해",
             "사기자": 0.011440,
             "일반인": 0.006575
         }, {
             "청구사유": "수술",
             "사기자": 0.100472,
             "일반인": 0.191030
         }, {
             "청구사유": "진단",
             "사기자": 0.038308,
             "일반인": 0.100094
         }, {
             "청구사유": "치료",
             "사기자": 0.000163,
             "일반인": 0.001747
         }, {
             "청구사유": "해지/무효",
             "사기자": 0,
             "일반인": 0.000053
         }];
         
         // Create axes
         var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
         categoryAxis.dataFields.category = "청구사유";
         categoryAxis.renderer.grid.template.location = 0;
         categoryAxis.renderer.minGridDistance = 30;
         
         var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
         valueAxis.title.text = "Claim rate";
         valueAxis.renderer.labels.template.adapter.add("text", function(text) {
           return Math.floor(text*100) + "%";
         });
         
         // Create series
         var series = chart.series.push(new am4charts.ColumnSeries3D());
         series.dataFields.valueY = "사기자";
         series.dataFields.categoryX = "청구사유";
         series.name = "사기자";
         series.clustered = false;
         series.columns.template.tooltipText = "[#fff font-size: 15px]사기자의{청구사유}: [#fff bold]{valueY}[/]%";
         series.columns.template.fillOpacity = 0.9;
         series.fill = am4core.color("#FA5882");
         
         var series2 = chart.series.push(new am4charts.ColumnSeries3D());
         series2.dataFields.valueY = "일반인";
         series2.dataFields.categoryX = "청구사유";
         series2.name = "일반인";
         series2.clustered = false;
         series2.columns.template.tooltipText = "일반인의{청구사유}: [bold]{valueY}[/]%";
         series2.fill = am4core.color("rgb(103, 148, 220)");
         var columnTemplate = series.columns.template;
         columnTemplate.strokeWidth = 2;
         columnTemplate.strokeOpacity = 1;
         columnTemplate.stroke = am4core.color("#FFFFFF");
         
         
         
         }); // end am4core.ready()
//         세번쨰 청구 사유 코드
      $("#chartText_sub2").empty()
        $("#chartContent_sub2").empty()
        $("#chartdiv_sub2").empty()
      $("#chartText_sub2").append("보험 청구횟수")
      $("#chart3").css("display","block");
      $("#selectArea").css("display","none");
      $("#selectArea2").css("display","none");
      $("#chart2").css("display","block");
        am4core.ready(function() {

           // Themes begin
         am4core.useTheme(am4themes_animated);
         // Themes end
         
         // Create chart instance
         var chart = am4core.create("chartdiv_sub2", am4charts.XYChart3D);
         
         chart.legend = new am4charts.Legend();
           chart.legend.position = "end";   
         // Add data
         chart.data = [{
             "청구횟수": "10회 ↓",
             "사기자": 0.346971,
             "일반인": 0.763085
         }, {
             "청구횟수": "10~19",
             "사기자": 0.368181,
             "일반인": 0.148387
         }, {
             "청구횟수": "20~29",
             "사기자": 0.195774,
             "일반인": 0.051188

         }, {
             "청구횟수": "30~39",
             "사기자": 0.052964,
             "일반인": 0.017267
         }, {
             "청구횟수": "40~49",
             "사기자": 0.015918,
             "일반인": 0.006924
         }, {
             "청구횟수": "50~59",
             "사기자": 0.006758,
             "일반인": 0.004129
         }, {
             "청구횟수": "60~69",
             "사기자": 0.004275,
             "일반인": 0.002721
         }, {
             "청구횟수": "70~79",
             "사기자": 0.002524,
             "일반인": 0.001493
         }, {
             "청구횟수": "80~89",
             "사기자": 0.001669,
             "일반인": 0.001101
         }, {
             "청구횟수": "90~99",
             "사기자": 0.001466,
             "일반인": 0.000995
         }, {
             "청구횟수": "100↑",
             "사기자": 0.003501,
             "일반인": 0.002710
         }];
         
         // Create axes
         var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
         categoryAxis.dataFields.category = "청구횟수";
         categoryAxis.renderer.grid.template.location = 0;
         categoryAxis.renderer.minGridDistance = 30;
         
         var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
         valueAxis.title.text = "ClaimCount rate";
         valueAxis.renderer.labels.template.adapter.add("text", function(text) {
           return Math.floor(text*100) + "%";
         });
         
         // Create series
         var series = chart.series.push(new am4charts.ColumnSeries3D());
         series.dataFields.valueY = "사기자";
         series.dataFields.categoryX = "청구횟수";
         series.name = "사기자";
         series.clustered = false;
         series.columns.template.tooltipText = "[#fff font-size: 15px]사기자의{청구횟수}: [#fff bold]{valueY}[/]%";
         series.columns.template.fillOpacity = 0.9;
         series.fill = am4core.color("#FA5882");
         
         var series2 = chart.series.push(new am4charts.ColumnSeries3D());
         series2.dataFields.valueY = "일반인";
         series2.dataFields.categoryX = "청구횟수";
         series2.name = "일반인";
         series2.clustered = false;
         series2.columns.template.tooltipText = "일반인의{청구횟수}: [bold]{valueY}[/]%";
         series2.fill = am4core.color("rgb(103, 148, 220)");
         var columnTemplate = series.columns.template;
         columnTemplate.strokeWidth = 2;
         columnTemplate.strokeOpacity = 1;
         columnTemplate.stroke = am4core.color("#FFFFFF");
         
         
         
         }); // end am4core.ready()
    // 4번쨰 사기자이 많이 사용한 패턴
      $("#chartText_sub3").empty()
        $("#chartContent_sub3").empty()
        $("#chartdiv_sub3").empty()
      $("#chartText_sub3").append("사기자의 수법")
      $("#chart4").css("display","block");
      $("#chart2").css("display","block");
      am4core.ready(function() {

         // Themes begin
         am4core.useTheme(am4themes_animated);
         // Themes end

         var chart = am4core.create("chartdiv_sub3", am4charts.PieChart3D);
         chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

         chart.data = [{
              "비고": "질병&입원",
              "count": 12746
            }, {
              "비고": "재해&입원",
              "count": 4390
            }, {
              "비고": "질병&수술",
              "count": 2012
            }, {
              "비고": "교통&입원",
              "count": 1896
            }, {
              "비고": "질병&통원",
              "count": 1225
            },{
              "비고": "재해&진단",
              "count": 734
            }, {
              "비고": "재해&통원",
              "count": 500
            }, {
              "비고": "재해&수술",
              "count": 389
            }, {
              "비고": "재해&장해",
              "count": 152
            }, {
              "비고": "질병&진단",
              "count": 123
            }, {
              "비고": "교통&장해",
              "count": 97
            }, {
              "비고": "교통&진단",
              "count": 84
            }, {
              "비고": "교통&통원",
              "count": 77
            }, {
              "비고": "교통&수술",
              "count": 67
            }, {
              "비고": "질병&장해",
              "count": 32
            }, {
              "비고": "질병&사망",
              "count": 30
            }, {
              "비고": "질병&치료",
              "count": 4
            }, {
              "비고": "교통&사망",
              "count": 3
            }, {
              "비고": "재해&사망",
              "count": 3
            }
            ];

         chart.innerRadius = am4core.percent(30);
         chart.depth = 70;

         chart.legend = new am4charts.Legend();

         var series = chart.series.push(new am4charts.PieSeries3D());
         series.dataFields.value = "count";
         series.dataFields.depthValue = "count";
         series.dataFields.category = "비고";
         series.slices.template.cornerRadius = 5;
         series.colors.step = 3;

         });
      
   });
// 주의 병원 의사 top5
$("#dangerDocAndHos").hover(function(){
    $('html').css("cursor","pointer");
},function(){
   $('html').css("cursor","auto");
})   
$("#dangerDocAndHos").on("click",function(){
// 1.첫번쨰 사기 유형 
   am4core.disposeAllCharts();
   $("#chart2").css("display","block");
   $("#chart3").css("display","block");
   $("#chart4").css("display","block");
   emptyContent(1);
   $("#chart1").css("height","400");
   $("#chartText").append("사기자인 사람 중에서 병원&의사와의 관계");
   var text = $( "<hr> <br>"
		   		 +"<h4 style='color:red'>변수 중요도가 높은 변수에 의사, 병원이 나와 두가지 변수에 대한 세부적인 데이터를 확인하고자함. </h4>  \n" 
		         +"<h4>아래의 병원, 의사 관련 도표는 사기자가 청구한 청구 정보 중에서 병원과 의사가 가담한 비율이 얼마인지를 확인하고 많이 가담한 병원과 의사를 보여줌 </h4>");
   $("#chartdiv").append(text)
   $("#chartdiv").append("")
   emptyContent(2);
   $("#chartText_sub").append("병원별 사기 가담비율")
   am4core.ready(function() {

// Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end
      
      var chart = am4core.create("chartdiv_sub", am4charts.SlicedChart);
      chart.hiddenState.properties.opacity = 0; // this makes initial fade in effect
      
      chart.data = [{
          "name": "100%",
          "value": 62 
      }, {
          "name": "80%~100%",
          "value": 237 
      }, {
          "name": "60%~80%",
          "value": 388 
      }, {
          "name": "40%~60%",
          "value": 545 
      }, {
          "name": "20%~40%",
          "value": 689 
      }, {
          "name": "20%↓",
          "value": 741 
      }];
      var series = chart.series.push(new am4charts.FunnelSeries());
      series.colors.step = 1;
      series.dataFields.value = "value";
      series.dataFields.category = "name";
      series.alignLabels = true;
      
      series.labelsContainer.paddingLeft = 15;
      series.labelsContainer.width = 200;
      
      //series.orientation = "horizontal";
      //series.bottomRatio = 1;
      
      chart.legend = new am4charts.Legend();
      chart.legend.position = "end";
      chart.legend.valign = "bottom";
      chart.legend.margin(5,5,20,5);
      
      }); // end am4core.ready()
   emptyContent(3);
   $("#chartText_sub2").append("의사별 사기 가담비율")
   $("#selectArea").css("display","block");
   am4core.ready(function() {
      
      // Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end

      var iconPath = "M53.5,476c0,14,6.833,21,20.5,21s20.5-7,20.5-21V287h21v189c0,14,6.834,21,20.5,21 c13.667,0,20.5-7,20.5-21V154h10v116c0,7.334,2.5,12.667,7.5,16s10.167,3.333,15.5,0s8-8.667,8-16V145c0-13.334-4.5-23.667-13.5-31 s-21.5-11-37.5-11h-82c-15.333,0-27.833,3.333-37.5,10s-14.5,17-14.5,31v133c0,6,2.667,10.333,8,13s10.5,2.667,15.5,0s7.5-7,7.5-13 V154h10V476 M61.5,42.5c0,11.667,4.167,21.667,12.5,30S92.333,85,104,85s21.667-4.167,30-12.5S146.5,54,146.5,42 c0-11.335-4.167-21.168-12.5-29.5C125.667,4.167,115.667,0,104,0S82.333,4.167,74,12.5S61.5,30.833,61.5,42.5z"



      var chart = am4core.create("chartdiv_sub2", am4charts.SlicedChart);
      chart.hiddenState.properties.opacity = 0; // this makes initial fade in effect

      
      d_data= [{
          "name": "100%",
          "value": 2275  
      },     
      {  
         "name": "80% ↑ 100% ↓",
         "value": 2547-2275   
      }, 
      {
          "name": "60%↑ 80%↓ ",
          "value": 698 
      }, {
          "name": "40% ↑ 60%↓",
          "value": 980 
      }, {
          "name": "20%↑ 40%↓",
          "value": 1145
      }, {
          "name": "20%↓",
          "value": 781 
      }];
      
      h_data = [{
          "name": "100%",
          "value": 753  
      },     
      {  
         "name": "80% ↑ 100% ↓",
         "value": 380  
      }, 
      {
          "name": "60%↑ 80%↓ ",
          "value": 566 
      }, {
          "name": "40% ↑ 60%↓",
          "value": 541 
      }, {
          "name": "20%↑ 40%↓",
          "value": 1251
      }, {
          "name": "20%↓",
          "value": 7079 
      }];
      
      
      chart.data = d_data
      $("#test").off().on("change",function(){
           var select = document.getElementById("test");
           var option_value = select.options[select.selectedIndex].value;
           var option_text   = select.options[select.selectedIndex].text;
           if(option_value ==1){
              $("#chartText_sub2").empty()
              fadeEvent(2);
              $("#chartText_sub2").append("의사별 사기 가담비율")
           }else{
              $("#chartText_sub2").empty()
              fadeEvent(2);
              $("#chartText_sub2").append("의사,병원 중복 사기 가담비율")
              
           }
           
           
           selectDataset(option_value)
        })
        
        function selectDataset(set) {
          if(set == 1){
           chart.data = d_data;
          }else{
           chart.data = h_data; 
          }
          
        }
      
      
      
      var series = chart.series.push(new am4charts.PictorialStackedSeries());
      series.dataFields.value = "value";
      series.dataFields.category = "name";
      series.alignLabels = true;

      series.maskSprite.path = iconPath;
      series.ticks.template.locationX = 1;
      series.ticks.template.locationY = 0.5;

      series.labelsContainer.width = 200;

      chart.legend = new am4charts.Legend();
      chart.legend.position = "left";
      chart.legend.valign = "bottom";

      });
   
   
   
   
   emptyContent(4);
   $("#selectArea2").css("display","block")
   $("#chartText_sub3").append("사기자와 많이 가담한 병원 TOP5")
   
   am4core.ready(function() {

      // Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end

      /**
       * Chart design taken from Samsung health app
       */

      var chart = am4core.create("chartdiv_sub3", am4charts.XYChart);
      chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

      chart.paddingBottom = 30;
     
      data1 = [{
          "name": "4670",
          "steps": 123,
          "href": 'assets/img/statistic/icon/588hospital_100778.svg'
        	  
      }, {
          "name": "42",
          "steps": 130,
          "href": 'assets/img/statistic/icon/hospital_health_clinic_urban_buildings_medical_icon_128575.svg'
      }, {
          "name": "5194",
          "steps": 222,
          "href": 'assets/img/statistic/icon/hospital_health_medical_clinic_building_icon_133553.svg'
      }, {
          "name": "1402",
          "steps": 255,
          "href": 'assets/img/statistic/icon/hospital_building_healthcare_hospital_medical_clinic_icon_141518.svg'
      }, {
          "name": "12537",
          "steps": 3525,
          "href": 'assets/img/statistic/icon/hospital_place_building_location_healthy_icon_140209.svg'
          
      }];
      
      
      data2 = [{
          "name": "99999999",
          "steps": 128,
          "href": 'assets/img/statistic/icon/medical-29_icon-icons.com_73943.svg'

      }, {
          "name": "11570",
          "steps": 129,
          "href": 'assets/img/statistic/icon/medical_medicine_doctor_hospital_icon_143393.svg'
      }, {
          "name": "3723",
          "steps": 196,
          "href": 'assets/img/statistic/icon/doctor_avatar_medical_icon_140443.svg'
      }, {
          "name": "25697",
          "steps": 293,
          "href": 'assets/img/statistic/icon/avatar_doctor_health_hospital_medical_icon_140096.svg'
      }, {
          "name": "25700",
          "steps": 321,
          "href": 'assets/img/statistic/icon/doctor_jobs_healthcare_medical_hospital_icon_140657.svg'
      }];
      
      
      chart.data = data1
      
      
      $("#test2").off().on("change",function(){
           var select = document.getElementById("test2");
           var option_value = select.options[select.selectedIndex].value;
           var option_text   = select.options[select.selectedIndex].text;
           if(option_value ==1){
              $("#chartText_sub3").empty()
              fadeEvent(3);
              $("#chartText_sub3").append("사기자와 많이 가담한 병원 TOP5")
           }else{
              $("#chartText_sub3").empty()
              fadeEvent(3);
              $("#chartText_sub3").append("사기자와 많이 가담한 의사 TOP5")
              
           }
           
           
           selectDataset(option_value)
        })
        function selectDataset(set) {
             if(set == 1){
              chart.data = data1;
             }else{
              chart.data = data2; 
             }
             
        }
      
      
      var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
      categoryAxis.dataFields.category = "name";
      categoryAxis.renderer.grid.template.strokeOpacity = 0;
      categoryAxis.renderer.minGridDistance = 10;
      categoryAxis.renderer.labels.template.dy = 35;
      categoryAxis.renderer.tooltip.dy = 35;

      var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
      valueAxis.renderer.inside = true;
      valueAxis.renderer.labels.template.fillOpacity = 0.3;
      valueAxis.renderer.grid.template.strokeOpacity = 0;
      valueAxis.min = 0;
      valueAxis.cursorTooltipEnabled = false;
      valueAxis.renderer.baseGrid.strokeOpacity = 0;

      var series = chart.series.push(new am4charts.ColumnSeries);
      series.dataFields.valueY = "steps";
      series.dataFields.categoryX = "name";
      series.tooltipText = "{valueY.value}";
      series.tooltip.pointerOrientation = "vertical";
      series.tooltip.dy = - 6;
      series.columnsContainer.zIndex = 100;

      var columnTemplate = series.columns.template;
      columnTemplate.width = am4core.percent(40);
      columnTemplate.maxWidth = 66;
      columnTemplate.column.cornerRadius(60, 60, 10, 10);
      columnTemplate.strokeOpacity = 0;

      series.heatRules.push({ target: columnTemplate, property: "fill", dataField: "valueY", min: am4core.color("#e5dc36"), max: am4core.color("#5faa46") });
      series.mainContainer.mask = undefined;

      var cursor = new am4charts.XYCursor();
      chart.cursor = cursor;
      cursor.lineX.disabled = true;
      cursor.lineY.disabled = true;
      cursor.behavior = "none";

      var bullet = columnTemplate.createChild(am4charts.CircleBullet);
      bullet.circle.radius = 30;
      bullet.valign = "bottom";
      bullet.align = "center";
      bullet.isMeasured = true;
      bullet.mouseEnabled = false;
      bullet.verticalCenter = "bottom";
      bullet.interactionsEnabled = false;

      var hoverState = bullet.states.create("hover");
      var outlineCircle = bullet.createChild(am4core.Circle);
      outlineCircle.adapter.add("radius", function (radius, target) {
          var circleBullet = target.parent;
          return circleBullet.circle.pixelRadius + 10;
      })

      var image = bullet.createChild(am4core.Image);
      image.width = 60;
      image.height = 60;
      image.horizontalCenter = "middle";
      image.verticalCenter = "middle";
      image.propertyFields.href = "href";

      image.adapter.add("mask", function (mask, target) {
          var circleBullet = target.parent;
          return circleBullet.circle;
      })

      var previousBullet;
      chart.cursor.events.on("cursorpositionchanged", function (event) {
          var dataItem = series.tooltipDataItem;

          if (dataItem.column) {
              var bullet = dataItem.column.children.getIndex(1);

              if (previousBullet && previousBullet != bullet) {
                  previousBullet.isHover = false;
              }

              if (previousBullet != bullet) {

                  var hs = bullet.states.getKey("hover");
                  hs.properties.dy = -bullet.parent.pixelHeight + 30;
                  bullet.isHover = true;

                  previousBullet = bullet;
              }
          }
      })

      }); // end am4core.ready()
   
   // 의사코드 top5
   

});
$("#inforData").hover(function(){
    $('html').css("cursor","pointer");
},function(){
   $('html').css("cursor","auto");
})
$("#inforData").on("click", function(){
    emptyContent(1);
    am4core.disposeAllCharts();
    $("#chart1").css("height","");
    $("#chartText").append("사기자의 결혼 유무");
    $("#chart2").css("display","block");
   $("#chart3").css("display","block");
   $("#chart4").css("display","block");
   $("#selectArea").css("display","none");
   $("#selectArea2").css("display","block");
   am4core.ready(function() {

      // Themes begin
   
      am4core.useTheme(am4themes_animated);
      
      // Themes end

      var iconPath = "M421.976,136.204h-23.409l-0.012,0.008c-0.19-20.728-1.405-41.457-3.643-61.704l-1.476-13.352H5.159L3.682,74.507 C1.239,96.601,0,119.273,0,141.895c0,65.221,7.788,126.69,22.52,177.761c7.67,26.588,17.259,50.661,28.5,71.548  c11.793,21.915,25.534,40.556,40.839,55.406l4.364,4.234h206.148l4.364-4.234c15.306-14.85,29.046-33.491,40.839-55.406  c11.241-20.888,20.829-44.96,28.5-71.548c0.325-1.127,0.643-2.266,0.961-3.404h44.94c49.639,0,90.024-40.385,90.024-90.024  C512,176.588,471.615,136.204,421.976,136.204z M421.976,256.252h-32c3.061-19.239,5.329-39.333,6.766-60.048h25.234  c16.582,0,30.024,13.442,30.024,30.024C452,242.81,438.558,256.252,421.976,256.252z"

      var chart = am4core.create("chartdiv", am4charts.SlicedChart);
      chart.hiddenState.properties.opacity = 0; // this makes initial fade in effect
      chart.paddingLeft = 150;

      chart.data = [{
          "name": "네",
          "value": 1062,
          "disabled":true
      }, {
          "name": "아니요",
          "value": 744,
          "config": {
              "fill": "#FA5882"
            }
      }];

      var series = chart.series.push(new am4charts.PictorialStackedSeries());
      series.dataFields.value = "value";
      series.dataFields.category = "name";
      series.alignLabels = true;
      // this makes only A label to be visible
      series.labels.template.propertyFields.disabled = "disabled";
      series.ticks.template.propertyFields.disabled = "disabled";


      series.maskSprite.path = iconPath;
      series.ticks.template.locationX = 1;
      series.ticks.template.locationY = 0;

      series.labelsContainer.width = 100;
      series.fill = am4core.color("rgb(103, 148, 220)");
      
      series.slicesContainer.background.fill = am4core.color("#FA5882");
      chart.legend = new am4charts.Legend();
      chart.legend.position = "top";
      chart.legend.paddingRight = 160;
      chart.legend.paddingBottom = 40;
      let marker = chart.legend.markers.template.children.getIndex(0);
      chart.legend.markers.template.width = 40;
      chart.legend.markers.template.height = 40;
      marker.cornerRadius(20,20,20,20);
   

      });// end 사기자 결혼 유무
   emptyContent(2);
   $("#chartText_sub").append("사기자의  자녀 비율")
   am4core.ready(function() {

// Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end
      
      var iconPath = "M53.5,476c0,14,6.833,21,20.5,21s20.5-7,20.5-21V287h21v189c0,14,6.834,21,20.5,21 c13.667,0,20.5-7,20.5-21V154h10v116c0,7.334,2.5,12.667,7.5,16s10.167,3.333,15.5,0s8-8.667,8-16V145c0-13.334-4.5-23.667-13.5-31 s-21.5-11-37.5-11h-82c-15.333,0-27.833,3.333-37.5,10s-14.5,17-14.5,31v133c0,6,2.667,10.333,8,13s10.5,2.667,15.5,0s7.5-7,7.5-13 V154h10V476 M61.5,42.5c0,11.667,4.167,21.667,12.5,30S92.333,85,104,85s21.667-4.167,30-12.5S146.5,54,146.5,42 c0-11.335-4.167-21.168-12.5-29.5C125.667,4.167,115.667,0,104,0S82.333,4.167,74,12.5S61.5,30.833,61.5,42.5z"
      
      
      
      var chart = am4core.create("chartdiv_sub", am4charts.SlicedChart);
      chart.hiddenState.properties.opacity = 0; // this makes initial fade in effect
      
      chart.data = [{
          "name": "없음",
          "value": 967
      }, {
          "name": "1명",
          "value": 355
      }, {
          "name": "2명",
          "value": 372
      }, {
          "name": "3명",
          "value": 87
      }, {
          "name": "4명",
          "value": 24
      }, {
          "name": "5명",
          "value": 0
      }, {
          "name": "6명",
          "value": 1
      }];
      
      var series = chart.series.push(new am4charts.PictorialStackedSeries());
      series.dataFields.value = "value";
      series.dataFields.category = "name";
      series.alignLabels = true;
      
      series.maskSprite.path = iconPath;
      series.ticks.template.locationX = 1;
      series.ticks.template.locationY = 0.5;
      
      series.labelsContainer.width = 200;
      
      chart.legend = new am4charts.Legend();
      chart.legend.position = "left";
      chart.legend.valign = "bottom";
      
      }); // end am4core.ready()
   emptyContent(3)
   $("#chart3").css("display","block");
   $("#chartText_sub2").append("사기자의 주거유형")
   am4core.ready(function() {

      // Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end

      var chart = am4core.create("chartdiv_sub2", am4charts.PieChart3D);
      chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

      chart.data = [
        {
          country: "아파트",
          litres: 832
        },
        {
          country: "다가구단독주택",
          litres: 243
        },
        {
          country: "연립_다가구주택",
          litres: 235
        },
        {
          country: "비거주용건물",
          litres: 151
        },
        {
          country: "일반단독주택",
          litres: 129
        },
        {
          country: "그외",
          litres: 118
        },
        {
         country: "영업겸용단독주택",
         litres: 82
        },
        {
         country: "오피스텔",
         litres: 9
        },
        {
         country: "판자집",
         litres: 3
        },
        {
         country: "기숙사",
         litres: 1
        }
      ];

      chart.innerRadius = am4core.percent(40);
      chart.depth = 120;

      chart.legend = new am4charts.Legend();

      var series = chart.series.push(new am4charts.PieSeries3D());
      series.dataFields.value = "litres";
      series.dataFields.depthValue = "litres";
      series.dataFields.category = "country";
      series.slices.template.cornerRadius = 5;
      series.colors.step = 3;

      }); // end am4core.ready()
   $("#chart4").css("display","block");
   $("#chartText_sub3").append("주거 가격")
   $("#selectArea2").css("display","none");
   emptyContent(4);
   $("#chartText_sub3").append("주거 가격");
   am4core.ready(function() {

        // Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end
      
      // Create chart instance
      var chart = am4core.create("chartdiv_sub3", am4charts.XYChart3D);
      
      chart.legend = new am4charts.Legend();
        chart.legend.position = "end";   
      // Add data
      chart.data = [{
          "주거가격": "5천만↓",
          "사기자": 0.155837,
          "일반인": 0.105692
      }, {
          "주거가격": "1억↓",
          "사기자":  0.293847,
          "일반인":  0.252293
      }, {
          "주거가격": "1억5천↓",
          "사기자": 0.215641,
          "일반인": 0.198279

      }, {
          "주거가격": "2억↓",
          "사기자": 0.124209,
          "일반인": 0.143354
      }, {
          "주거가격": "2억5천↓",
          "사기자": 0.077631,
          "일반인": 0.099083
      }, {
          "주거가격": "3억↓",
          "사기자": 0.049454,
          "일반인": 0.065808
      }, {
          "주거가격": "3억5천↓",
          "사기자": 0.028177,
          "일반인":  0.045240
      }, {
          "주거가격": "4억↓",
          "사기자": 0.018401,
          "일반인": 0.027463
      }, {
          "주거가격": "4억5천↓",
          "사기자": 0.010926,
          "일반인":  0.019030
      }, {
          "주거가격": "4억5천↑",
          "사기자": 0.006901+0.018976,
          "일반인": 0.011452+0.032306
      }];
      
      // Create axes
      var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
      categoryAxis.dataFields.category = "주거가격";
      categoryAxis.renderer.grid.template.location = 0;
      categoryAxis.renderer.minGridDistance = 30;
      
      var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
      valueAxis.title.text = "Prices rate";
      valueAxis.renderer.labels.template.adapter.add("text", function(text) {
        return Math.floor(text*100) + "%";
      });
      
      // Create series
      var series = chart.series.push(new am4charts.ColumnSeries3D());
      series.dataFields.valueY = "사기자";
      series.dataFields.categoryX = "주거가격";
      series.name = "사기자";
      series.clustered = false;
      series.columns.template.tooltipText = "[#fff font-size: 15px]사기자 {주거가격}: [#fff bold]{valueY}[/]%";
      series.columns.template.fillOpacity = 0.9;
      series.fill = am4core.color("#FA5882");
      
      var series2 = chart.series.push(new am4charts.ColumnSeries3D());
      series2.dataFields.valueY = "일반인";
      series2.dataFields.categoryX = "주거가격";
      series2.name = "일반인";
      series2.clustered = false;
      series2.columns.template.tooltipText = "일반인 {주거가격}: [bold]{valueY}[/]%";
      series2.fill = am4core.color("rgb(103, 148, 220)");
      var columnTemplate = series.columns.template;
      columnTemplate.strokeWidth = 2;
      columnTemplate.strokeOpacity = 1;
      columnTemplate.stroke = am4core.color("#FFFFFF");
      
      
      
      }); // end am4core.ready()

   
})
$("#inforData2").hover(function(){
    $('html').css("cursor","pointer");
},function(){
   $('html').css("cursor","auto");
})
$("#inforData2").on("click", function(){
 
    am4core.disposeAllCharts();
    $("#chart1").css("height","");
    $("#chart2").css("display","block");
   $("#chart3").css("display","block");
   $("#chart4").css("display","block");
   $("#selectArea").css("display","none");
   $("#selectArea2").css("display","none");
   $("#selectArea3").css("display","none");

   emptyContent(1);
    $("#chartText").append("납입한 최대 월 보험료")     -
   am4core.ready(function() {
            
         // Themes begin
         am4core.useTheme(am4themes_animated);
         // Themes end
         
         // Create chart instance
         var chart = am4core.create("chartdiv", am4charts.XYChart3D);
         chart.legend = new am4charts.Legend();
           chart.legend.position = "end";   
         // Add data
         chart.data = [{
             "premium": "20↓",
             "사기자": 0.456250,
             "일반인": 0.446557
         }, {
             "premium": "20~40",
             "사기자": 0.209722,
             "일반인": 0.246193
         }, {
             "premium": "40~60",
             "사기자": 0.108333,
             "일반인": 0.116734
         }, {
             "premium": "60~80",
             "사기자": 0.068750,
             "일반인": 0.060980
         }, {
             "premium": "80~100",
             "사기자": 0.045139,
             "일반인": 0.034391
         }, {
             "premium": "100~120",
             "사기자": 0.022917,
             "일반인": 0.024316
         }, {
             "premium": "120~140",
             "사기자": 0.020833,
             "일반인": 0.014999
         }, {
             "premium": "140~160",
             "사기자": 0.011806,
             "일반인": 0.010757
         }, {
             "premium": "160~180",
             "사기자": 0.008333,
             "일반인": 0.007727
         }, {
             "premium": "180↑",
             "사기자": 0.047917,
             "일반인": 0.037346
         }];
         
         // Create axes
         var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
         categoryAxis.dataFields.category = "premium";
         categoryAxis.title.text = "보험료(단위 : 만원)";
         categoryAxis.renderer.grid.template.location = 0;
         categoryAxis.renderer.minGridDistance = 30;
         
         var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
         valueAxis.title.text = "Premium rate";
         valueAxis.renderer.labels.template.adapter.add("text", function(text) {
           return Math.floor(text*100) + "%";
         });
         
         // Create series
         var series = chart.series.push(new am4charts.ColumnSeries3D());
         series.dataFields.valueY = "사기자";
         series.dataFields.categoryX = "premium";
         series.name = "사기자";
         series.clustered = false;
         series.columns.template.tooltipText = "사기자 {category} (보험료): [bold]{valueY}[/]";
         series.columns.template.fillOpacity = 0.9;
         series.fill = am4core.color("#FA5882");
         var series2 = chart.series.push(new am4charts.ColumnSeries3D());
         series2.dataFields.valueY = "일반인";
         series2.dataFields.categoryX = "premium";
         series2.name = "일반인";
         series2.clustered = false;
         series2.columns.template.tooltipText = "일반인{category} (보험료): [bold]{valueY}[/]";
         series2.fill = am4core.color("rgb(103, 148, 220)");
         }); // end am4core.ready()   
   
   
   
   
   
   
   
   emptyContent(2);
   $("#chartText_sub").append("납입한 총 보험료");
   $("#chartContent_sub").append("고객이 지금까지 당사에 실제 납입한 총 보험료의 합계");
am4core.ready(function() {
      
        // Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end
      
      // Create chart instance
      var chart = am4core.create("chartdiv_sub", am4charts.XYChart3D);
      
      chart.legend = new am4charts.Legend();
        chart.legend.position = "end";   
      // Add data
      
      
      incm_data1 = [{
          "추정소득": "천만↓",
          "사기자": 0.419333,
          "일반인": 0.344117
      }, {
          "추정소득": "천만↑",
          "사기자":  0.186667,
          "일반인":  0.222400
      }, {
          "추정소득": "2천만↑",
          "사기자": 0.095333,
          "일반인": 0.141230

      }, {
          "추정소득": "3천만↑",
          "사기자": 0.070667,
          "일반인": 0.082330
      }, {
          "추정소득": "4천만↑",
          "사기자": 0.062000,
          "일반인": 0.054330
      }, {
          "추정소득": "5천만↑",
          "사기자": 0.043333,
          "일반인": 0.039243
      }, {
          "추정소득": "6천만↑",
          "사기자": 0.028000,
          "일반인": 0.021761
      }, {
          "추정소득": "7천만↑",
          "사기자": 0.016667,
          "일반인": 0.020238
      }, {
          "추정소득": "8천만↑",
          "사기자": 0.013333,
          "일반인": 0.013202
      }, {
          "추정소득": "9천만↑",
          "사기자": 0.010667+0.054000,
          "일반인": 0.010590 +0.050559
      }];
      
      chart.data = incm_data1
      
      // Create axes
      var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
      categoryAxis.dataFields.category = "추정소득";
      categoryAxis.renderer.grid.template.location = 0;
      categoryAxis.renderer.minGridDistance = 30;
      categoryAxis.title.text = "보험료(단위 : 천만원)";
      var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
      valueAxis.title.text = "Premium rate";
      valueAxis.renderer.labels.template.adapter.add("text", function(text) {
        return Math.floor(text*100) + "%";
      });
      
      // Create series
      var series = chart.series.push(new am4charts.ColumnSeries3D());
      series.dataFields.valueY = "사기자";
      series.dataFields.categoryX = "추정소득";
      series.name = "사기자";
      series.clustered = false;
      series.columns.template.tooltipText = "[#fff font-size: 15px]사기자 {추정소득}: [#fff bold]{valueY}[/]%";
      series.columns.template.fillOpacity = 0.9;
      series.fill = am4core.color("#FA5882");
      
      var series2 = chart.series.push(new am4charts.ColumnSeries3D());
      series2.dataFields.valueY = "일반인";
      series2.dataFields.categoryX = "추정소득";
      series2.name = "일반인";
      series2.clustered = false;
      series2.columns.template.tooltipText = "일반인 {추정소득}: [bold]{valueY}[/]%";
      series2.fill = am4core.color("rgb(103, 148, 220)");
      var columnTemplate = series.columns.template;
      columnTemplate.strokeWidth = 2;
      columnTemplate.strokeOpacity = 1;
      columnTemplate.stroke = am4core.color("#FFFFFF");
      
      
      
      }); // end am4core.ready()
   emptyContent(3);
   $("#chartText_sub2").append("개인추정 소득");
   $("#chartContent_sub2").append("고객의 연령/직업/보험료 수준등을 통한 고객의 개인 소득 추정금액");
   am4core.ready(function() {
      
        // Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end
      
      // Create chart instance
      var chart = am4core.create("chartdiv_sub2", am4charts.XYChart3D);
      
      chart.legend = new am4charts.Legend();
        chart.legend.position = "end";   
      // Add data
        chart.data = [{
          "추정소득": "천만↑",
          "사기자": 0,
          "일반인": 0.000276
      }, {
          "추정소득": "2천만↑",
          "사기자":  0.051450,
          "일반인":  0.069844
      }, {
          "추정소득": "3천만↑",
          "사기자": 0.418148,
          "일반인": 0.371768

      }, {
          "추정소득": "4천만↑",
          "사기자": 0.364827,
          "일반인": 0.378577
      }, {
          "추정소득": "5천만↑",
          "사기자": 0.131899,
          "일반인": 0.141069
      }, {
          "추정소득": "6천만↑",
          "사기자": 0.027128,
          "일반인": 0.025306
      }, {
          "추정소득": "7천만↑",
          "사기자": 0.000935,
          "일반인": 0.008098
      }, {
          "추정소득": "8천만↑",
          "사기자": 0.003742,
          "일반인": 0.002761
      }, {
          "추정소득": "9천만↑",
          "사기자": 0.000935,
          "일반인": 0.001196
      }, {
          "추정소득": "1억↑",
          "사기자": 0.000935,
          "일반인": 0.001104
      }];
      
      
      // Create axes
      var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
      categoryAxis.dataFields.category = "추정소득";
      categoryAxis.renderer.grid.template.location = 0;
      categoryAxis.renderer.minGridDistance = 30;
      categoryAxis.title.text = "보험료(단위 : 천만원)";
      var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
      valueAxis.title.text = "";
      valueAxis.renderer.labels.template.adapter.add("text", function(text) {
        return Math.floor(text*100) + "%";
      });
      
      // Create series
      var series = chart.series.push(new am4charts.ColumnSeries3D());
      series.dataFields.valueY = "사기자";
      series.dataFields.categoryX = "추정소득";
      series.name = "사기자";
      series.clustered = false;
      series.columns.template.tooltipText = "[#fff font-size: 15px]사기자 {추정소득}: [#fff bold]{valueY}[/]%";
      series.columns.template.fillOpacity = 0.9;
      series.fill = am4core.color("#FA5882");
      
      var series2 = chart.series.push(new am4charts.ColumnSeries3D());
      series2.dataFields.valueY = "일반인";
      series2.dataFields.categoryX = "추정소득";
      series2.name = "일반인";
      series2.clustered = false;
      series2.columns.template.tooltipText = "일반인 {추정소득}: [bold]{valueY}[/]%";
      series2.fill = am4core.color("rgb(103, 148, 220)");
      var columnTemplate = series.columns.template;
      columnTemplate.strokeWidth = 2;
      columnTemplate.strokeOpacity = 1;
      columnTemplate.stroke = am4core.color("#FFFFFF");
      
      
      
      }); // end am4core.ready()
   $("#selectArea2").css("display","block");
   emptyContent(4);
   $("#chartText_sub3").append("추정가구 소득(1)")
   $("#chartContent_sub3").append("고객의 주택가격을 우선하여 정한 가구소득 추정금액")
   am4core.ready(function() {
      
        // Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end
      
      // Create chart instance
      var chart = am4core.create("chartdiv_sub3", am4charts.XYChart3D);
      
      chart.legend = new am4charts.Legend();
        chart.legend.position = "end";   
      // Add data
      
      
      incm_data1 = [{
          "추정소득": "천만↓",
          "사기자": 0,
          "일반인": 0.000576
      }, {
          "추정소득": "천만↑",
          "사기자":  0.016327,
          "일반인":  0.021567
      }, {
          "추정소득": "2천만↑",
          "사기자": 0.080272,
          "일반인": 0.074619

      }, {
          "추정소득": "3천만↑",
          "사기자": 0.180952,
          "일반인": 0.163638
      }, {
          "추정소득": "4천만↑",
          "사기자": 0.194558,
          "일반인": 0.169397
      }, {
          "추정소득": "5천만↑",
          "사기자": 0.191156,
          "일반인": 0.176757
      }, {
          "추정소득": "6천만↑",
          "사기자": 0.130612,
          "일반인": 0.133175
      }, {
          "추정소득": "7천만↑",
          "사기자": 0.068027,
          "일반인": 0.076347
      }, {
          "추정소득": "8천만↑",
          "사기자": 0.045578,
          "일반인": 0.053565
      }, {
          "추정소득": "9천만↑",
          "사기자": 0.042857 +0.049660,
          "일반인": 0.056188 +0.074171
      }];
      
      incm_data2 = [{
          "추정소득": "천만↓",
          "사기자": 0,
          "일반인": 0.000468
      }, {
          "추정소득": "천만↑",
          "사기자":  0.009774,
          "일반인":  0.015563
      }, {
          "추정소득": "2천만↑",
          "사기자": 0.060476,
          "일반인": 0.075240

      }, {
          "추정소득": "3천만↑",
          "사기자": 0.234575,
          "일반인": 0.216476
      }, {
          "추정소득": "4천만↑",
          "사기자": 0.243739,
          "일반인": 0.225193
      }, {
          "추정소득": "5천만↑",
          "사기자": 0.150886,
          "일반인": 0.139714
      }, {
          "추정소득": "6천만↑",
          "사기자": 0.067807,
          "일반인": 0.067868
      }, {
          "추정소득": "7천만↑",
          "사기자": 0.057422,
          "일반인": 0.065586   
      }, {
          "추정소득": "8천만↑",
          "사기자": 0.061698,
          "일반인": 0.072724
      }, {
          "추정소득": "9천만↑",
          "사기자": 0.059502 +0.061666,
          "일반인": 0.054979 +0.058644
      }];
      
      chart.data = incm_data1
      
      $("#test2").off().on("change",function(){
           var select = document.getElementById("test2");
           var option_value = select.options[select.selectedIndex].value;
           var option_text   = select.options[select.selectedIndex].text;
           if(option_value ==1){
              $("#chartText_sub3").empty()
              $("#chartContent_sub3").empty()
              fadeEvent(3);
              $("#chartText_sub3").append("추정가구 소득(1)")
              $("#chartContent_sub3").append("고객의 주택가격을 우선하여 정한 가구소득 추정금액")
           }else{
              $("#chartText_sub3").empty()
              $("#chartContent_sub3").empty()
              fadeEvent(3);
              $("#chartText_sub3").append("추정가구 소득(2)")
              $("#chartContent_sub3").append("고객의 직업 및 납입보험료 수준을 우선하여 정한 가구소득 추정금액")
              
           }
           
           
           selectDataset(option_value)
        })
        function selectDataset(set) {
             if(set == 1){
              chart.data = incm_data1;
             }else{
              chart.data = incm_data2; 
             }
             
        }
      
      // Create axes
      var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
      categoryAxis.dataFields.category = "추정소득";
      categoryAxis.renderer.grid.template.location = 0;
      categoryAxis.renderer.minGridDistance = 30;
      categoryAxis.title.text = "보험료(단위 : 천만원)";
      var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
      valueAxis.title.text = "";
      valueAxis.renderer.labels.template.adapter.add("text", function(text) {
        return Math.floor(text*100) + "%";
      });
      
      // Create series
      var series = chart.series.push(new am4charts.ColumnSeries3D());
      series.dataFields.valueY = "사기자";
      series.dataFields.categoryX = "추정소득";
      series.name = "사기자";
      series.clustered = false;
      series.columns.template.tooltipText = "[#fff font-size: 15px]사기자 {추정소득}: [#fff bold]{valueY}[/]%";
      series.columns.template.fillOpacity = 0.9;
      series.fill = am4core.color("#FA5882");
      
      var series2 = chart.series.push(new am4charts.ColumnSeries3D());
      series2.dataFields.valueY = "일반인";
      series2.dataFields.categoryX = "추정소득";
      series2.name = "일반인";
      series2.clustered = false;
      series2.columns.template.tooltipText = "일반인 {추정소득}: [bold]{valueY}[/]%";
      series2.fill = am4core.color("rgb(103, 148, 220)");
      var columnTemplate = series.columns.template;
      columnTemplate.strokeWidth = 2;
      columnTemplate.strokeOpacity = 1;
      columnTemplate.stroke = am4core.color("#FFFFFF");
      
      
      
      }); // end am4core.ready()

});
$("#inforData3").hover(function(){
    $('html').css("cursor","pointer");
},function(){
   $('html').css("cursor","auto");
})
$("#inforData3").on("click", function(){
    am4core.disposeAllCharts();
   $("#chart1").css("height","");
   $("#chart2").css("display","block");
   $("#chart3").css("display","block");
   $("#chart4").css("display","none");
   $("#selectArea2").css("display","none");
   emptyContent(1);
   $("#chartText").append("일반인 분포지역");
   am4core.ready(function() {

      // Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end

      var chart = am4core.create("chartdiv", am4charts.PieChart3D);
      chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

      chart.data = [
        {
          country: "경기",
          litres: 5016
        },
        {
          country: "서울",
          litres: 3083
        },
        {
          country: "경남",
          litres: 1368
        },
        {
          country: "부산 ",
          litres: 1192
        },
        {
          country: "인천",
          litres: 1153
        },
        {
          country: "전남 ",
          litres: 934
        },
        {
         country: "대구 ",
         litres: 853
        },
        {
         country: "경북 ",
         litres: 851
        },
        {
          country: "전북 ",
          litres: 790
         },
         {
          country: "충남 ",
          litres: 654
         },
         {
          country: "광주 ",
          litres: 641
         },
         {
           country: "울산",
           litres: 626
         },
         {
           country: "충북",
           litres: 555
         },
         {
           country: "강원",
           litres: 450
         },
         {
           country: "대전",
           litres: 426
         },
         {
           country: "제주",
           litres: 174
         },
         {
           country: "세종",
           litres: 35
         }
      ];

      chart.innerRadius = am4core.percent(40);
      chart.depth = 120;

      chart.legend = new am4charts.Legend();

      var series = chart.series.push(new am4charts.PieSeries3D());
      series.dataFields.value = "litres";
      series.dataFields.depthValue = "litres";
      series.dataFields.category = "country";
      series.slices.template.cornerRadius = 5;
      series.colors.step = 3;

      }); // end am4core.ready()   
      emptyContent(2);
      $("#chartText_sub").append("사기자 분포지역");
      am4core.ready(function() {

         // Themes begin
         am4core.useTheme(am4themes_animated);
         // Themes end

         var chart = am4core.create("chartdiv_sub", am4charts.PieChart3D);
         chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

         chart.data = [
             {
               country: "경기",
               litres: 377
             },
             {
               country: "서울",
               litres: 306
             },
             {
               country: "경남",
               litres: 198
             },
             {
               country: "부산 ",
               litres: 181
             },
             {
               country: "인천",
               litres: 181
             },
             {
               country: "광주",
               litres: 156
             },
             {
              country: "전북",
              litres: 102
             },
             {
              country: "전남",
              litres: 102
             },
             {
               country: "경남 ",
               litres: 94
              },
              {
               country: "강원",
               litres: 74
              },
              {
               country: "대구 ",
               litres: 56
              },
              {
                country: "경북",
                litres: 45
              },
              {
                country: "대전",
                litres: 40
              },
              {
                country: "충남",
                litres: 39
              },
              {
                country: "울산",
                litres: 19
              },
              {
                country: "충북",
                litres: 15
              },
              {
                country: "세종",
                litres: 2
              }
           ];

         chart.innerRadius = am4core.percent(40);
         chart.depth = 120;

         chart.legend = new am4charts.Legend();

         var series = chart.series.push(new am4charts.PieSeries3D());
         series.dataFields.value = "litres";
         series.dataFields.depthValue = "litres";
         series.dataFields.category = "country";
         series.slices.template.cornerRadius = 5;
         series.colors.step = 3;

         }); // end am4core.ready()        
   emptyContent(3);
   $("#selectArea").css("display","block");
   $("#chartText_sub2").append("일반인 주의 병원 방문 분포 ")
   $("#chartContent_sub2").append("금감원 유의 병원 대상 여부")
   am4core.ready(function() {

      // Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end

      var chart = am4core.create("chartdiv_sub2", am4charts.PieChart3D);
      chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

      chart.legend = new am4charts.Legend();

      
      
      
      var data1 = [
        {
          visit: "아니요",
          value: 115685
        },
        {
          visit: "네",
          value: 3335
        }
      ];
      
      var data2 = [
           {
             visit: "아니요",
             value: 23671
           },
           {
             visit: "네",
             value: 893
           }
         ];
      
      chart.data = data1
        $("#test").off().on("change",function(){
           var select = document.getElementById("test");
           var option_value = select.options[select.selectedIndex].value;
           var option_text   = select.options[select.selectedIndex].text;
           if(option_value ==1){
              $("#chartText_sub2").empty()
              fadeEvent(2);
              $("#chartText_sub2").append("일반인 주의 병원 방문 분포")
           }else{
              $("#chartText_sub2").empty()
              fadeEvent(2);
              $("#chartText_sub2").append("사기자 주의 병원 방문 분포")
              
           }
          selectDataset(option_value)
        })
        
        function selectDataset(set) {
             if(set == 1){
              chart.data = data1;
             }else{
              chart.data = data2; 
             }
             
        }
      

      var series = chart.series.push(new am4charts.PieSeries3D());
      series.dataFields.value = "value";
      series.dataFields.category = "visit";

      });
   
   
   
});
function emptyContent(i){
   if(i === 1){
        $("#chartText").empty()
        $("#chartContent").empty()
        $("#chartdiv").empty()   
   }else if(i === 2){
        $("#chartText_sub").empty()
        $("#chartContent_sub").empty()
        $("#chartdiv_sub").empty()   
   }else if(i === 3){
        $("#chartText_sub2").empty()
        $("#chartContent_sub2").empty()
        $("#chartdiv_sub2").empty()   
      
   }else if(i === 4){
        $("#chartText_sub3").empty()
        $("#chartContent_sub3").empty()
        $("#chartdiv_sub3").empty()   
   };
};

function fadeEvent(i){

	if(i == 2){

		$("#chart3").fadeOut(500);
		$("#chart3").fadeIn(1000);
		return false;
	}else if(i == 3){

		$("#chart4").fadeOut(500);
		$("#chart4").fadeIn(1000);
		return false;
	}else{
	 
	}
	
};

$(".searchBtn").on("click", function(){
       var checkBtn = $(this);
       var tr = checkBtn.parent().parent();
      var td = tr.children();
      var custId = td.eq(1).text();
      console.log(custId)
      $.ajax({
         url:"<c:url value='/restTest/'/>"+custId,
         type:"GET",
         dataType:'json',
         data:{},
         timeout:100000,
         beforeSend: function() {
            $('.wrap-loading').removeClass('display-none');
         },complete:function(){
             $('.wrap-loading').addClass('display-none');  
         },
         success:function(result){
            console.log(result);
            
            data = JSON.parse(result[0])
            data2 = JSON.parse(result[1])
            data3 = JSON.parse(result[2])
            data4 = JSON.parse(result[3])
        
            Highcharts.chart('container', {
              chart: {
                  plotBackgroundColor: null,
                  plotBorderWidth: null,
                  plotShadow: false,
                  type: 'pie'
              },
              title: {
                  text: data[0]["CUST_ID"] + '의 보험 사기자일 확률',
                  style: {
                      color: '#007bff',
                      fontWeight: 900
                  }
              },
              tooltip: {
                  pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
              },
              accessibility: {
                  point: {
                      valueSuffix: '%'
                  }
              },
              plotOptions: {
                  pie: {
                      allowPointSelect: true,
                      cursor: 'pointer',
                      colors: pieColors,
                      dataLabels: {
                          enabled: true,
                          format: '<b>{point.name}</b><br>{point.percentage:.1f} %',
                          distance: -50,
                          filter: {
                              property: 'percentage',
                              operator: '>',
                              value: 4
                          },
                          style:{
                              fontFamily: 'monospace',
                            fontSize: '1.2em',
                            fontWeight: 0
                          }
                          
                      }
                  }
              },
              series: [{
                  name: '보험사기자',
                  data: [
                      { name: '일반인', y: data[0]["NO"] },
                      { name: '사기꾼', y: data[0]["YES"] }
                   
                  ],
                  animation: {
                      duration: 3000
                  }
                  
              
              }]
          });
            Highcharts.chart('container2', {
              chart: {
                  plotBackgroundColor: null,
                  plotBorderWidth: null,
                  plotShadow: false,
                  type: 'pie'
              },
              title: {
                  text: "인공신경망",
                  style: {
                      color: '#007bff',
                      fontWeight: 100,
                      fontSize: '1.2em'
                  }
              },
              tooltip: {
                  pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
              },
              accessibility: {
                  point: {
                      valueSuffix: '%'
                  }
              },
              plotOptions: {
                  pie: {
                      allowPointSelect: true,
                      cursor: 'pointer',
                      colors: pieColors,
                      dataLabels: {
                          enabled: false,
                          format: '<b>{point.name}</b><br>{point.percentage:.1f} %',
                          distance: -50,
                          filter: {
                              property: 'percentage',
                              operator: '>',
                              value: 4
                          }
                      }
                  }
              },
              series: [{
                  name: '보험사기자',
                  data: [
                      { name: '일반인', y: data2[0]["NO"] },
                      { name: '사기꾼', y: data2[0]["YES"] },
                  ]
              }]
          });
            Highcharts.chart('container3', {
              chart: {
                  plotBackgroundColor: null,
                  plotBorderWidth: null,
                  plotShadow: false,
                  type: 'pie'
              },
              title: {
                  text: "XGBOOST",
                  style: {
                      color: '#007bff',
                      fontWeight: 100,
                      fontSize: '1.2em'
                  }
              },
              tooltip: {
                  pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
              },
              accessibility: {
                  point: {
                      valueSuffix: '%'
                  }
              },
              plotOptions: {
                  pie: {
                      allowPointSelect: true,
                      cursor: 'pointer',
                      colors: pieColors,
                      dataLabels: {
                          enabled: false,
                          format: '<b>{point.name}</b><br>{point.percentage:.1f} %',
                          distance: -50,
                          filter: {
                              property: 'percentage',
                              operator: '>',
                              value: 4
                          }
                      }
                  }
              },
              series: [{
                  name: '보험사기자',
                  data: [
                      { name: '일반인', y: data3[0]["NO"] },
                      { name: '사기꾼', y: data3[0]["YES"] },
                  ]
              }]
          });
           // -----
            Highcharts.chart('container4', {
              chart: {
                  plotBackgroundColor: null,
                  plotBorderWidth: null,
                  plotShadow: false,
                  type: 'pie'
              },
              title: {
                  text: "Random Forest",
                  style: {
                      color: '#007bff',
                      fontWeight: 100,
                      fontSize: '1.2em'
                  }
              },
              tooltip: {
                  pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
              },
              accessibility: {
                  point: {
                      valueSuffix: '%'
                  }
              },
              plotOptions: {
                  pie: {
                      allowPointSelect: true,
                      cursor: 'pointer',
                      colors: pieColors,
                      dataLabels: {
                          enabled: false,
                          format: '<b>{point.name}</b><br>{point.percentage:.1f} %',
                          distance: -50,
                          filter: {
                              property: 'percentage',
                              operator: '>',
                              value: 4
                          }
                      }
                  }
              },
              series: [{
                  name: '보험사기자',
                  data: [
                      { name: '일반인', y: data4[0]["NO"] },
                      { name: '사기꾼', y: data4[0]["YES"] },
                  ]
              }]
          });
         $("#textArea").empty() 
      if(data[0]["SIU_CUST_YN"] ==0){
         $("#textArea").append("<h2> 일반인일 확률이 더 높습니다. </h2>")
      
         $("#textArea").focus();
         }else{
            $("#textArea").append("<h2> 사기꾼일 확률이 더 높습니다. </h2>")
         } 
             
            
      },
      error:function(request,status,error){
           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
      })
     })
     
     // Make monochrome colors
      var pieColors = (function () {
          var colors = [],
              base = Highcharts.getOptions().colors[0],
              i;
      
          for (i = 0; i < 10; i += 1) {
              // Start out with a darkened base color (negative brighten), and end
              // up with a much brighter color
              colors.push(Highcharts.color(base).brighten((i) / 5).get());
          }
          return colors;
      }());

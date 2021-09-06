<?php
// function get_browser_name($user_agent){
//     $t = strtolower($user_agent);
//     $t = " " . $t;
//     if     (strpos($t, 'opera'     ) || strpos($t, 'opr/')     ) return 'Opera'            ;   
//     elseif (strpos($t, 'edge'      )                           ) return 'Edge'             ;   
//     elseif (strpos($t, 'chrome'    )                           ) return 'Chrome'           ;   
//     elseif (strpos($t, 'safari'    )                           ) return 'Safari'           ;   
//     elseif (strpos($t, 'firefox'   )                           ) return 'Firefox'          ;   
//     elseif (strpos($t, 'msie'      ) || strpos($t, 'trident/7')) return 'Internet Explorer';
//     return 'Unkown';
// }
// echo get_browser_name("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36");
?>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" />
        <!-- End -->


        <div class="container">
        <div class="row">
        <div class="col-sm-8 col-md-8 col-lg-8" id="select_customer" style="display:non">
                        <div class="">
                        
                        <select name="langOpt[]" multiple id="langOpt">
    <option value="C++">C++</option>
    <option value="C#">C#</option>
    <option value="Java">Java</option>
    <option value="Objective-C">Objective-C</option>
    <option value="JavaScript">JavaScript</option>
    <option value="Perl">Perl</option>
    <option value="PHP">PHP</option>
    <option value="Ruby on Rails">Ruby on Rails</option>
    <option value="Android">Android</option>
    <option value="iOS">iOS</option>
    <option value="HTML">HTML</option>
    <option value="XML">XML</option>
</select>
                        </div>
                        </div>
        
        </div>
        </div>
     <script>
        $(document).ready(function(){
      $('select[multiple]').multiselect();
      $('#langOpt').multiselect({
        columns: 1,
    search: true,
    selectAll: true
});
        });
     </script>
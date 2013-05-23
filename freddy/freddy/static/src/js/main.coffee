require.config
  paths:
    "jquery": "../../components/jquery/jquery",
    "require": "../../components/require",
    "galleria": "../../components/jquery-galleria/src/galleria"
    "bootstrap": "../../components/bootstrap/js/bootstrap"
    "hashnav": "../../components/hashnav/hashnav"

  shim:
    'galleria': ['jquery']
    'bootstrap': ['jquery']

require ['jquery', 'hashnav', 'galleria', 'bootstrap'], ($)->
  $(document).ready ()->
    
    menuIn = (event)->
      $("#left").css("left", 0)
      $("#right").css("right", "")
      $("#gallery_holder").css("padding-left","55px")
      $("#nav-right").css("right","")

      $("#control").one "click", menuOut
      $("#control").text("<< Less")
      $("#control").css("bottom", '')

    menuOut = (event)->
      $("#left").css("left", '')
      $("#right").css("right", "-220px")
      $("#gallery_holder").css("padding-left","0")
      $("#nav-right").css("right","-54px")

      $("#control").one "click", menuIn
      $("#control").text(">> More")
      $("#control").css("bottom",$(window).height() - 133)

    $("#control").one "click", menuOut
    $("#control").one "click", ()->
      $(".gallery_selection").off()
    $(".gallery_selection").one 'click', menuOut

    Galleria.loadTheme '/static/components/jquery-galleria/src/themes/folio/galleria.folio.min.js'
    for gallery, i in gallery_data
      $('.gallery').eq(i).galleria {transition: 'fade',  dataSource: gallery}
   

    navigate = (hash) ->
      if hash isnt "index"
        galleryDiv = "#gallery-" + hash
        navDiv = "#nav-" + hash
        $(".link-container").removeClass("selected")
        $(navDiv).addClass("selected")

        $(".selected-right").removeClass("selected-right")
        $("#right-nav-"+hash).addClass("selected-right")

        height = -$(".selected-gallery").height()
        $(".selected-gallery").css("top", height+"px").removeClass("selected-gallery")
        $(galleryDiv).addClass("selected-gallery").css("top", 0)

      else
        $("#selection .gallery_selection span").eq(0).addClass("selected")
        $(".gallery").eq(0).addClass("selected-gallery").css("top",0)
        $(".gallery-selection-right a").eq(0).addClass("selected-right")

    HashNav.initial("index")
    HashNav.change(navigate)

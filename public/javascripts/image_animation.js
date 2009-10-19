dojo.addOnLoad(function() {
    var list = dojo.query("#product-list table tr td a");
    var props = {
      i: { width:96, height:96, top:-16, left:-102 },
      o: { width:64, height:64, top:0, left:-80 }
    };
    
    list.forEach(function(n) {
        var img = dojo.query("img", n)[0], a;
        dojo.connect(img, "onmouseenter", function(e) {
            a && a.stop();
            a = dojo.anim(img, props.i, 175);
          });

        dojo.connect(img, "onmouseleave", function(e) {
            a && a.stop();
            a = dojo.anim(img, props.o, 175, null, null, 75);
          });
      });
  });

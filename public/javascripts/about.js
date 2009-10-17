var dialog = new dojox.widget.Dialog({
    dimensions:[640,420]
},"about-dialog");

dialog.startup();

// setup a way to show it
dojo.connect(dojo.byId("about"), "onclick", dialog, "show");

	
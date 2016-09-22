var Accordion = (function () {
  return {
    setup: function (app) {
      app.ports.toggleAccordion.subscribe(function(id) {
        alert(id);
        var elem = document.getElementById(id);

        jQuery(elem).parent().find('.submenu').slideToggle('fast');
      });
    }
  }
})();

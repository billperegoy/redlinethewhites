var Accordion = (function () {
  return {
    setup: function (app) {
      app.ports.toggleAccordion.subscribe(function(id) {
        var elem = document.getElementById(id);

        jQuery(elem).parent().find('.submenu').slideToggle('fast');
        //jQuery(elem).parent().toggleClass('is-expanded');
      });
    }
  }
})();

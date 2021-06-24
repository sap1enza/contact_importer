$(document).ready(function(){
  $("#js-import").submit(function(e) {
      e.preventDefault();

      if ($(this).attr('action') == '/import') {
        e.currentTarget.submit();
      }

      var formData = new FormData(this);

      $.ajax({
        url: '/imports/get_headers',
        type: 'post',
        data: formData,
        processData: false,
        contentType: false,
        cache: false,
        enctype: "multipart/form-data",
        dataType: "json",
        success: function(data){
          if(!$("#js-import-step-1").is(':visible')) {
            return;
          }

          $("#js-import").attr('action', '/import');
          $("#js-import-step-1").fadeOut();

          headers_table = import_headers_table_html(data);
          $("#js-import-step-2").append(headers_table).fadeIn(800);

          $("#js-import-submit-btn").fadeOut().val("Import").fadeIn(800);
        }
      })
  });

  function import_headers_table_html(data) {
    html = "<tbody>"

    $.each(data["contact_columns"], function(key, value) {
      html += "<tr>"
      html += `<th scope="row"> ${StringHelper.humanize(value)} </th>`
      html += "<td>"
      html += `<select name="import[${value}]" class="form-select">`

      $.each(data["headers"], function(key, value) {
        html += `<option value="${value}">${value}</option>`
      });

      html += "</select>"
      html += "</td>"
      html += "</tr>"
    })

    html += "</tbody>"

    return html
  }
});

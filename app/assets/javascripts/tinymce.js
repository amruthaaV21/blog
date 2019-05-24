(function(){
// encapsulating
  var iu = document.getElementById('image_uploader');
  iu.addEventListener('change',send_after_choose);

  function send_after_choose(event){
    // some multipart ajax U need to create new FormData see documentation of use
    // when done fetch url
  }
  // this need to be global function.
  function file_upload(field_name, url, type, win){
    var iu = document.getElementById('image_uploader');
    iu.click();
  }
  window.file_upload=file_upload;
})();
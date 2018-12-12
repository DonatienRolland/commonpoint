function participationsAjaxShow(){
  const divStatus = document.querySelectorAll('.changingStatus')


  divStatus.forEach((statu) => {
    statu.addEventListener('click', function() {
      console.log(statu.dataset.status)
      // $.ajax({
      //   url: divMap.dataset.url,
      //   type: "PUT",
      //   data: { params_value: sendValue },
      // });
    })
  })

}


export { participationsAjax }

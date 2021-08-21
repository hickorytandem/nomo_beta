// Will return an array of all the modal containers
const initOrderModal = () => {
  const modalContainers = document.querySelectorAll('.order-modal')
  modalContainers.forEach(modalContainer => {
    // When the user clicks on <span> (x), close the modal
    var modal = modalContainer.querySelector('.modal');
    var btn = modalContainer.querySelector('.order-modal-btn');
    var span = modalContainer.querySelector(".close");

    // When the user clicks on the button, open the modal
    btn.onclick = function () {
      console.log("Hello");
      modal.style.display = "block";
    }

    span.onclick = function () {
      modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    // window.onclick = function (event) {
    //   if (event.target == modal) {
    //     // modal.style.display = "none";
    //   }
    // }
  }
  );
};

export {initOrderModal};

// Iterate on each modalContainer and run the code you had before on it, just update the selectors:

// ... etc.

// // Get the modal
// var modal = document.getElementById("myModal");

// // Get the button that opens the modal
// var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal


// ------------------------------------------------------------------------------

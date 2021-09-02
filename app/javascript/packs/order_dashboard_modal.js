// Will return an array of all the modal containers
const initOrderDashboardModal = () => {
  const modals = document.querySelectorAll('.dashboard-modal');
  const closers = document.querySelectorAll('.icon-close');
  const btns = document.querySelectorAll('.order-modal-button')
  btns.forEach((btn, index) => {
    btn.addEventListener('click', (e) => {
      modals[index].style.display = "block"
    })
  })
  closers.forEach((closer, index) => {
    closer.addEventListener('click', (e) => {
      modals[index].style.display = "none"
    })
  })
};


export { initOrderDashboardModal };

// Will return an array of all the modal containers
const initOrderModal = () => {
    const modals = document.querySelectorAll('.modal');
    const closers = document.querySelectorAll('.close');
    const btns = document.querySelectorAll('.order-modal-btn')
    btns.forEach((btn,index)=>{
      btn.addEventListener('click', (e)=>{
        modals[index].style.display = "block"
      })
    })
    closers.forEach((closer,index)=> {
      closer.addEventListener('click', (e)=>{
        modals[index].style.display = "none"
      })
    })
};


export {initOrderModal};

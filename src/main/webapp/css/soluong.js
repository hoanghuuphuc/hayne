const incrementButton = document.querySelector('#increment');
const decrementButton = document.querySelector('#decrement');
const inputField = document.querySelector('input[name="soLuong"]');

incrementButton.addEventListener('click', () => {
    inputField.value = parseInt(inputField.value) + 1;
});

decrementButton.addEventListener('click', () => {
    inputField.value = parseInt(inputField.value) - 1;
});
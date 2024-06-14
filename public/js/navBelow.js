window.addEventListener('DOMContentLoaded', () => {
    if (window.location.pathname !== "/") {
        let navBelow = document.getElementsByClassName("nav-below");
        for (let i = 0; i < navBelow.length; i++) {
            navBelow[i].style.display = "none";
        }
    }
});
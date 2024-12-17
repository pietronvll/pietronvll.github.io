// Get the toggle button
const toggleButton = document.getElementById("theme-toggle");

// Function to set the theme
function setTheme(theme) {
    document.documentElement.classList.remove("light-theme", "dark-theme");

    if (theme === "light") {
        document.documentElement.classList.add("light-theme");
        localStorage.setItem("theme", "light");
    } else if (theme === "dark") {
        document.documentElement.classList.add("dark-theme");
        localStorage.setItem("theme", "dark");
    } else {
        localStorage.removeItem("theme");
    }
}

// Function to load the theme
function loadTheme() {
    const storedTheme = localStorage.getItem("theme");

    if (storedTheme) {
        setTheme(storedTheme);
    } else {
        // No stored theme, let the browser decide based on prefers-color-scheme
        document.documentElement.classList.remove("light-theme", "dark-theme");
    }
}

function updateButtonText() {
    const currentTheme = localStorage.getItem("theme");
    if (currentTheme === "light") {
        toggleButton.textContent = "Dark mode 🌗";
    } else {
        toggleButton.textContent = "Light mode 🌗";
    }
}

toggleButton.addEventListener("click", () => {
    const currentTheme = localStorage.getItem("theme");

    if (currentTheme === "light") {
        setTheme("dark");
    } else {
        setTheme("light");
    }
    updateButtonText();
});

// Update the button text on page load
loadTheme();
updateButtonText();
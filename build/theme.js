document.addEventListener("DOMContentLoaded", () => {
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

    // Function to update button icon with smooth transition
    function updateButtonIcon() {
        const currentTheme = localStorage.getItem("theme");
        const icon = currentTheme === "light" ? "moon" : "sun";
        
        // Add fade-out class
        toggleButton.classList.add("theme-toggle-fade");
        
        // Wait for fade out, then change icon and fade in
        setTimeout(() => {
            toggleButton.innerHTML = `<i data-lucide="${icon}"></i>`;
            lucide.createIcons(); // Re-initialize lucide for the new icon
            toggleButton.classList.remove("theme-toggle-fade");
        }, 150);
    }

    toggleButton.addEventListener("click", () => {
        const currentTheme = localStorage.getItem("theme");

        if (currentTheme === "light") {
            setTheme("dark");
        } else {
            setTheme("light");
        }
        updateButtonIcon();
    });

    // Initialize on page load
    loadTheme();
    updateButtonIcon();
});
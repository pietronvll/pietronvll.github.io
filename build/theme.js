document.addEventListener("DOMContentLoaded", () => {
    const toggleButton = document.getElementById("theme-toggle");
    const mediaQuery = window.matchMedia("(prefers-color-scheme: dark)");

    function getPreferredTheme() {
        return mediaQuery.matches ? "dark" : "light";
    }

    function setTheme(theme, persist = true) {
        document.documentElement.classList.remove("light-theme", "dark-theme");

        if (theme === "light") {
            document.documentElement.classList.add("light-theme");
            if (persist) {
                localStorage.setItem("theme", "light");
            }
        } else if (theme === "dark") {
            document.documentElement.classList.add("dark-theme");
            if (persist) {
                localStorage.setItem("theme", "dark");
            }
        }

        if (!persist) {
            localStorage.removeItem("theme");
        }
    }

    function loadTheme() {
        const storedTheme = localStorage.getItem("theme");
        if (storedTheme) {
            setTheme(storedTheme);
            return storedTheme;
        }

        const preferredTheme = getPreferredTheme();
        setTheme(preferredTheme, false);
        return preferredTheme;
    }

    function updateButtonIcon(theme) {
        const icon = theme === "light" ? "moon" : "sun";
        toggleButton.classList.add("theme-toggle-fade");

        setTimeout(() => {
            toggleButton.innerHTML = `<i data-lucide="${icon}"></i>`;
            lucide.createIcons();
            toggleButton.classList.remove("theme-toggle-fade");
        }, 150);
    }

    toggleButton.addEventListener("click", () => {
        const currentTheme = document.documentElement.classList.contains("light-theme") ? "light" : "dark";
        const nextTheme = currentTheme === "light" ? "dark" : "light";
        setTheme(nextTheme);
        updateButtonIcon(nextTheme);
    });

    mediaQuery.addEventListener("change", (event) => {
        if (!localStorage.getItem("theme")) {
            const nextTheme = event.matches ? "dark" : "light";
            setTheme(nextTheme, false);
            updateButtonIcon(nextTheme);
        }
    });

    const initialTheme = loadTheme();
    updateButtonIcon(initialTheme);
});

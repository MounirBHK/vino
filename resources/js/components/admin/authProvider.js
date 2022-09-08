export default {
    // called when the user attempts to log in
    login: ({ username, password }) => {
        if (username === "admin" && password === "admin") {
            localStorage.setItem("adminUser", username);
            return Promise.resolve({ redirectTo: "/admin/" });
        }
        return Promise.reject();
        // accept all username/password combinations
    },
    // called when the user clicks on the logout button
    logout: () => {
        localStorage.removeItem("adminUser");
        return Promise.resolve();
    },
    // called when the API returns an error
    checkError: ({ status }) => {
        if (status === 401 || status === 403) {
            localStorage.removeItem("adminUser");
            return Promise.reject();
        }
        return Promise.resolve();
    },
    // called when the user navigates to a new location, to check for authentication
    checkAuth: () => {
        return localStorage.getItem("adminUser")
            ? Promise.resolve()
            : Promise.reject();
    },
    // called when the user navigates to a new location, to check for permissions / roles
    getPermissions: () => Promise.resolve(),
};

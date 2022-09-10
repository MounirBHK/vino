import axios from "axios";
const hostOriginURL = window.location.origin;
const envoieIdentifiants = async (identifiants) => {
    return await axios.post(
        hostOriginURL + "/api/custom-auth/login",
        identifiants
    );
};

export default {
    // called when the user attempts to log in
    login: ({ username, password }) => {
        const credentials = { courriel: username, motDePasse: password };
        return envoieIdentifiants(credentials).then((response) => {
            localStorage.setItem("adminUser", JSON.stringify(response.data));
            return Promise.resolve({ redirectTo: "/admin/" });
        });
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

import React from "react";
import { useEffect } from "react";
import "./AdminHome.scss";
import { Admin, Resource, fetchUtils } from "react-admin";
import { useNavigate } from "react-router-dom";
import Dashboard from "./Dashboard";
import Bouteilles from "./bouteilles/Bouteilles";
import Users from "./Users";
import authProvider from "./authProvider";
import simpleRestProvider from "ra-data-simple-rest";

function AdminHome({ setBouteilles, bouteilles }) {
    const navigate = useNavigate();
    const userAdmin = JSON.parse(localStorage.getItem("adminUser")) || null;

    const httpClient = (url, options = {}) => {
        const token = userAdmin["access_token"] || null;
        if (!options.headers) {
            options.headers = new Headers({ Accept: "application/json" });
        }
        options.headers.set("Authorization", `Bearer ${token}`);
        return fetchUtils.fetchJson(url, options);
    };

    const dataProvider = simpleRestProvider(
        window.location.origin + "/api",
        httpClient
    );

    useEffect(() => {
        const adminUser = localStorage.getItem("adminUser") || null;
        if (window.location.pathname !== "/admin/login" && !adminUser)
            navigate("/admin/login", {});
    }, []);

    return (
        <Admin
            dashboard={Dashboard}
            dataProvider={dataProvider}
            authProvider={authProvider}
            basename="/admin"
        >
            <Resource
                name="bouteilles"
                list={Bouteilles}
                options={{
                    setBouteilles: setBouteilles,
                    bouteilles: bouteilles,
                }}
            />
            <Resource name="users" list={Users} />
        </Admin>
    );
}

export default AdminHome;

import React from "react";
import { useEffect } from "react";
import "./AdminHome.scss";
import { Admin, Resource } from "react-admin";
import { useNavigate } from "react-router-dom";
import Dashboard from "./Dashboard";
import Bouteilles from "./Bouteilles";
import authProvider from "./authProvider";
import simpleRestProvider from "ra-data-simple-rest";
import axios from "axios";

function AdminHome() {
    const navigate = useNavigate();
    const dataProvider = simpleRestProvider(window.location.origin + "/api");

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
            <Resource name="bouteilles" list={Bouteilles} />
        </Admin>
    );
}

export default AdminHome;

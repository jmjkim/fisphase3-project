import React from 'react';
import { Link } from 'react-router-dom';


const DepartmentSelector = ({setStoredDepartmentId, departments}) => {
    return (
        <div className="select_department_container">
            <b>Choose Department</b>

            <div>
                {departments.map(department => {
                    return(
                        <label key={department.department_of_engine_type}>
                            {department.department_of_engine_type.toUpperCase()}

                        <Link to={`/departments/${department.id}/engines`}>
                            <input type="button" value={department.id} style={{"cursor": "pointer"}} onClick={(e) => {
                            setStoredDepartmentId(e.target.value)
                            sessionStorage.setItem("sessionStoredDepartmentId", e.target.value)
                            }}/>
                        </Link>
                        </label>
                        )})}
                    <div>

                        <Link to="departments">
                            <input type="button" value="Back to Main"/>
                        </Link>
                    </div>
            </div>
        </div>)
}

export default DepartmentSelector;

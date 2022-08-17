import React, {useState, useEffect} from 'react';
import { Link } from 'react-router-dom';

import Navbar from "./Navbar"

const EngineDisplayer = ({storedDepartmentId}) => {
    const [engines, setEngines] = useState([])

    useEffect(() => {
        fetch(`http://localhost:9292/departments/${storedDepartmentId}/engines`)
        .then(r => r.json())
        .then(setEngines)
        .catch(err => alert(err.message))
      }, [storedDepartmentId])
  
    if (engines.length === 0) {
        return (
            <>
                <Navbar storedDepartmentId={storedDepartmentId}/>
                <h2>Engine does not exist</h2>
            </>
        )
    }
    else
        return (
            <>
                <Navbar storedDepartmentId={storedDepartmentId}/>

                <div className="list_of_engine_container">
                    {Object.values(engines).map((engine, index) => {
                        return (
                            <React.Fragment key={engine.id}>
                                <Link to={`/departments/${storedDepartmentId}/engines/update`} className="link">
                                    <div className="list_of_engine_row" onClick={() => {
                                            sessionStorage.setItem("storedEngineObjKeys", Object.keys(engine))
                                            sessionStorage.setItem("storedEngineObjValues", Object.values(engine))
                                        }}>

                                        <div className="number_of_engine_container">
                                            <b>Engine Number #{index + 1}</b>
                                        </div>

                                        <div className="list_of_engine_non_part_container">
                                            <div><b>Engine ID:</b> <span id="eid">{engine.manufactured_engine_id}</span></div>
                                            <div><b>VIN:</b> {engine.associated_vehicle_vin}</div>
                                            <div><b>Layout:</b> {engine.engine_layout}</div>
                                            <div><b>Remark:</b> {engine.remark}</div>
                                        </div>

                                        <div className="status_indicator">
                                            <div className="completed_status">Green: Complete</div>
                                            <div className="incompleted_status">Red: Incomplete</div>
                                        </div>

                                        <div className="list_of_engine_part_dotted_container"> 
                                            {engine.camshaft_built ? <div className="completed_status">camshaft_built</div> :
                                                                     <div className="incompleted_status">camshaft_built</div>}

                                            {engine.piston_built ? <div className="completed_status">piston_built</div> :
                                                                   <div className="incompleted_status">piston_built</div>}

                                            {engine.flywheel_built ? <div className="completed_status">flywheel_built</div> :
                                                                     <div className="incompleted_status">flywheel_built</div>}

                                            {engine.connecting_rod_built ? <div className="completed_status">connecting_rod_built</div> :
                                                                           <div className="incompleted_status">connecting_rod_built</div>}

                                            {engine.crankshaft_built ? <div className="completed_status">crankshaft_built</div> :
                                                                       <div className="incompleted_status">crankshaft_built</div>}

                                            {engine.sump_built ? <div className="completed_status">sump_built</div> :
                                                                 <div className="incompleted_status">sump_built</div>}

                                            {engine.camshaft_drive_belt_built ? <div className="completed_status">camshaft_drive_belt_built</div> :
                                                                                <div className="incompleted_status">camshaft_drive_belt_built</div>}
                                        </div>
                                    </div>
                                </Link>
                            </React.Fragment>
                        )})}
                </div>
            </>
            )
}

export default EngineDisplayer;
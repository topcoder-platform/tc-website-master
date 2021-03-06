package com.topcoder.web.ejb.project;

import com.topcoder.web.common.RowNotFoundException;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 21, 2005
 */
public interface Project extends EJBObject {
    void updateForLock(long projectId, String dataSource) throws RemoteException;

    int getProjectTypeId(long projectId, String dataSource) throws RowNotFoundException, RemoteException;

    long getComponentId(long projectId, String dataSource) throws RemoteException;
}
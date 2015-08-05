package Hibernate.que;

import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import Hibernate.queEntry.QueentryDAO;
import Hibernate.user.BaseHibernateDAO;

/**
 * A data access object (DAO) providing persistence and search support for Que
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see Hibernate.que.Que
 * @author MyEclipse Persistence Tools
 */
public class QueDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(QueDAO.class);
	// property constants
	public static final String QUE_NUM = "queNum";
	public static final String QUE_DESC = "queDesc";

	public void save(Que transientInstance) {
		log.debug("saving Que instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Que persistentInstance) {
		log.debug("deleting Que instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Que findById(java.lang.Integer id) {
		log.debug("getting Que instance with id: " + id);
		try {
			Que instance = (Que) getSession().get("Hibernate.que.Que", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findEntryByQue(Que que) {
		QueentryDAO dao = new QueentryDAO();
		log.debug("finding Que instance by example");
		try {
			List results = dao.findByParentId(que.getId());
			log.debug("根据queID查询分录:" + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("根据queID查询分录:", re);
			throw re;
		}
	}

	public List findByExample(Que instance) {
		log.debug("finding Que instance by example");
		try {
			List results = getSession().createCriteria("Hibernate.que.Que")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Que instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Que as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByQueNum(Object queNum) {
		return findByProperty(QUE_NUM, queNum);
	}

	public List findByQueDesc(Object queDesc) {
		return findByProperty(QUE_DESC, queDesc);
	}

	public List findAll() {
		log.debug("finding all Que instances");
		try {
			String queryString = "from Que";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Que merge(Que detachedInstance) {
		log.debug("merging Que instance");
		try {
			Que result = (Que) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Que instance) {
		log.debug("attaching dirty Que instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Que instance) {
		log.debug("attaching clean Que instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}
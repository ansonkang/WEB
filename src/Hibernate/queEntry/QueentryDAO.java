package Hibernate.queEntry;

import Hibernate.user.BaseHibernateDAO;
import java.util.List;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Queentry entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see Hibernate.queEntry.Queentry
 * @author MyEclipse Persistence Tools
 */
public class QueentryDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(QueentryDAO.class);
	// property constants
	public static final String PARENT_ID = "parentId";
	public static final String DESC = "desc";

	public void save(Queentry transientInstance) {
		log.debug("saving Queentry instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Queentry persistentInstance) {
		log.debug("deleting Queentry instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Queentry findById(java.lang.Integer id) {
		log.debug("getting Queentry instance with id: " + id);
		try {
			Queentry instance = (Queentry) getSession().get(
					"Hibernate.queEntry.Queentry", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Queentry instance) {
		log.debug("finding Queentry instance by example");
		try {
			List results = getSession()
					.createCriteria("Hibernate.queEntry.Queentry")
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
		log.debug("finding Queentry instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Queentry as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByParentId(Object parentId) {
		return findByProperty(PARENT_ID, parentId);
	}

	public List findByDesc(Object desc) {
		return findByProperty(DESC, desc);
	}

	public List findAll() {
		log.debug("finding all Queentry instances");
		try {
			String queryString = "from Queentry";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Queentry merge(Queentry detachedInstance) {
		log.debug("merging Queentry instance");
		try {
			Queentry result = (Queentry) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Queentry instance) {
		log.debug("attaching dirty Queentry instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Queentry instance) {
		log.debug("attaching clean Queentry instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}
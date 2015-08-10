package Hibernate.typeentry;

import Hibernate.user.BaseHibernateDAO;
import java.util.List;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Typeentry entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see Hibernate.typeentry.Typeentry
 * @author MyEclipse Persistence Tools
 */
public class TypeentryDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(TypeentryDAO.class);
	// property constants
	public static final String NUMBER = "number";
	public static final String NAME = "name";
	public static final String PARENT_ID = "parentId";

	public void save(Typeentry transientInstance) {
		log.debug("saving Typeentry instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Typeentry persistentInstance) {
		log.debug("deleting Typeentry instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Typeentry findById(java.lang.Integer id) {
		log.debug("getting Typeentry instance with id: " + id);
		try {
			Typeentry instance = (Typeentry) getSession().get(
					"Hibernate.typeentry.Typeentry", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Typeentry instance) {
		log.debug("finding Typeentry instance by example");
		try {
			List results = getSession()
					.createCriteria("Hibernate.typeentry.Typeentry")
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
		log.debug("finding Typeentry instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Typeentry as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByNumber(Object number) {
		return findByProperty(NUMBER, number);
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByParentId(Object parentId) {
		return findByProperty(PARENT_ID, parentId);
	}

	public List findAll() {
		log.debug("finding all Typeentry instances");
		try {
			String queryString = "from Typeentry";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Typeentry merge(Typeentry detachedInstance) {
		log.debug("merging Typeentry instance");
		try {
			Typeentry result = (Typeentry) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Typeentry instance) {
		log.debug("attaching dirty Typeentry instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Typeentry instance) {
		log.debug("attaching clean Typeentry instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}
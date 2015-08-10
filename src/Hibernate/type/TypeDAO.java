package Hibernate.type;

import Hibernate.user.BaseHibernateDAO;
import java.util.List;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for Type
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see Hibernate.type.Type
 * @author MyEclipse Persistence Tools
 */
public class TypeDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(TypeDAO.class);
	// property constants
	public static final String NUMBER = "number";
	public static final String NAME = "name";
	public static final String PARENTID = "parentid";

	public void save(Type transientInstance) {
		log.debug("saving Type instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Type persistentInstance) {
		log.debug("deleting Type instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Type findById(java.lang.Integer id) {
		log.debug("getting Type instance with id: " + id);
		try {
			Type instance = (Type) getSession().get("Hibernate.type.Type", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Type instance) {
		log.debug("finding Type instance by example");
		try {
			List results = getSession().createCriteria("Hibernate.type.Type")
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
		log.debug("finding Type instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Type as model where model."
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

	public List findByParentid(Object parentid) {
		return findByProperty(PARENTID, parentid);
	}

	public List findAll() {
		log.debug("finding all Type instances");
		try {
			String queryString = "from Type";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Type merge(Type detachedInstance) {
		log.debug("merging Type instance");
		try {
			Type result = (Type) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Type instance) {
		log.debug("attaching dirty Type instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Type instance) {
		log.debug("attaching clean Type instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}
package Hibernate.sales;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import Hibernate.user.BaseHibernateDAO;

/**
 * A data access object (DAO) providing persistence and search support for Sales
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see Hibernate.sales.Sales
 * @author MyEclipse Persistence Tools
 */
public class SalesDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(SalesDAO.class);
	// property constants
	public static final String WEEK = "week";
	public static final String AMOUNT = "amount";

	public void save(Sales transientInstance) {
		log.debug("saving Sales instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Sales persistentInstance) {
		log.debug("deleting Sales instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Sales findById(java.lang.Integer id) {
		log.debug("getting Sales instance with id: " + id);
		try {
			Sales instance = (Sales) getSession().get("Hibernate.sales.Sales",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Sales instance) {
		log.debug("finding Sales instance by example");
		try {
			List results = getSession().createCriteria("Hibernate.sales.Sales")
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
		log.debug("finding Sales instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Sales as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByWeek(Object week) {
		return findByProperty(WEEK, week);
	}

	public List findByAmount(Object amount) {
		return findByProperty(AMOUNT, amount);
	}

	public List findAll() {
		log.debug("finding all Sales instances");
		try {
			String queryString = "from Sales";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	// 返回最近几天的数据
	public List findAll(int i) {
		log.debug("finding all Sales instances");
		try {
			String queryString = "from Sales ORDER BY DATE DESC";
			Query queryObject = getSession().createQuery(queryString);
			List list = queryObject.list();
			List newList = new ArrayList();
			System.out.println(i - 1);
			for (int j = i - 1; j >= 0; j--) {
				newList.add(list.get(j));
			}

			return newList;

		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Sales merge(Sales detachedInstance) {
		log.debug("merging Sales instance");
		try {
			Sales result = (Sales) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Sales instance) {
		log.debug("attaching dirty Sales instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Sales instance) {
		log.debug("attaching clean Sales instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}
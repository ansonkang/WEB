package Hibernate.sales_brand;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import Hibernate.user.BaseHibernateDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * SalesBrand entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see Hibernate.sales_brand.SalesBrand
 * @author MyEclipse Persistence Tools
 */
public class SalesBrandDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(SalesBrandDAO.class);

	// property constants

	public void save(SalesBrand transientInstance) {
		log.debug("saving SalesBrand instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SalesBrand persistentInstance) {
		log.debug("deleting SalesBrand instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SalesBrand findById(Hibernate.sales_brand.SalesBrandId id) {
		log.debug("getting SalesBrand instance with id: " + id);
		try {
			SalesBrand instance = (SalesBrand) getSession().get(
					"Hibernate.sales_brand.SalesBrand", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SalesBrand instance) {
		log.debug("finding SalesBrand instance by example");
		try {
			List results = getSession()
					.createCriteria("Hibernate.sales_brand.SalesBrand")
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
		log.debug("finding SalesBrand instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from SalesBrand as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all SalesBrand instances");
		try {
			String queryString = "from SalesBrand";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public List findByDate(String strDate, int i) {
		log.debug("finding all SalesBrand instances");
		try {
			String queryString = "from SalesBrand where date=" + strDate
					+ " ORDER BY date desc,amount desc";
			Query queryObject = getSession().createQuery(queryString);
			List list = queryObject.list();
			List newList = new ArrayList();
			for (int j = i - 1; j >= 0; j--) {
				newList.add(list.get(j));
			}

			return newList;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SalesBrand merge(SalesBrand detachedInstance) {
		log.debug("merging SalesBrand instance");
		try {
			SalesBrand result = (SalesBrand) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SalesBrand instance) {
		log.debug("attaching dirty SalesBrand instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SalesBrand instance) {
		log.debug("attaching clean SalesBrand instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}
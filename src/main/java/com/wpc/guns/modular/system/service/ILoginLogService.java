package com.wpc.guns.modular.system.service;

import com.wpc.guns.modular.system.model.LoginLog;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 登录记录 服务类
 * </p>
 *
 * @author wangpengcheng123
 * @since 2018-02-22
 */
public interface ILoginLogService extends IService<LoginLog> {

    /**
     * 获取登录日志列表
     */
    List<Map<String, Object>> getLoginLogs(Page<LoginLog> page, String beginTime, String endTime, String logName, String orderByField, boolean asc);
}

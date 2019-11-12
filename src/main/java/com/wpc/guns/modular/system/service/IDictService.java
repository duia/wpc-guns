package com.wpc.guns.modular.system.service;

import com.wpc.guns.modular.system.model.Dict;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;
import java.util.Map;

/**
 * 字典服务
 *
 * @author wangpengcheng
 * @date 2017-04-27 17:00
 */
public interface IDictService extends IService<Dict> {

    /**
     * 添加字典
     */
    void addDict(String dictCode, String dictName, String dictTips, String dictValues);

    /**
     * 编辑字典
     */
    void editDict(Integer dictId, String dictCode, String dictName, String dictTips, String dicts);

    /**
     * 删除字典
     */
    void delteDict(Integer dictId);

    /**
     * 根据编码获取词典列表
     */
    List<Dict> selectByCode(String code);

    /**
     * 根据父类编码获取词典列表
     */
    List<Dict> selectByParentCode(String code);

    /**
     * 查询字典列表
     */
    List<Map<String, Object>> list(String conditiion);

}

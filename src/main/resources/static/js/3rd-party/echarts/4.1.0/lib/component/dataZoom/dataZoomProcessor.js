var echarts = require("../../echarts");

var _util = require("zrender/lib/core/util");

var createHashMap = _util.createHashMap;
var each = _util.each;

/*
* Licensed to the Apache Software Foundation (ASF) under one
* or more contributor license agreements.  See the NOTICE file
* distributed with this work for additional information
* regarding copyright ownership.  The ASF licenses this file
* to you under the Apache License, Version 2.0 (the
* "License"); you may not use this file except in compliance
* with the License.  You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing,
* software distributed under the License is distributed on an
* "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
* KIND, either express or implied.  See the License for the
* specific language governing permissions and limitations
* under the License.
*/
echarts.registerProcessor({
  // `dataZoomProcessor` will only be performed in needed series. Consider if
  // there is a line series and a pie series, it is better not to update the
  // line series if only pie series is needed to be updated.
  getTargetSeries: function (ecModel) {
    var seriesModelMap = createHashMap();
    ecModel.eachComponent('dataZoom', function (dataZoomModel) {
      dataZoomModel.eachTargetAxis(function (dimNames, axisIndex, dataZoomModel) {
        var axisProxy = dataZoomModel.getAxisProxy(dimNames.name, axisIndex);
        each(axisProxy.getTargetSeriesModels(), function (seriesModel) {
          seriesModelMap.set(seriesModel.uid, seriesModel);
        });
      });
    });
    return seriesModelMap;
  },
  modifyOutputEnd: true,
  // Consider appendData, where filter should be performed. Because data process is
  // in block mode currently, it is not need to worry about that the overallProgress
  // execute every frame.
  overallReset: function (ecModel, api) {
    ecModel.eachComponent('dataZoom', function (dataZoomModel) {
      // We calculate window and reset axis here but not in model
      // init stage and not after action dispatch handler, because
      // reset should be called after seriesData.restoreData.
      dataZoomModel.eachTargetAxis(function (dimNames, axisIndex, dataZoomModel) {
        dataZoomModel.getAxisProxy(dimNames.name, axisIndex).reset(dataZoomModel, api);
      }); // Caution: data zoom filtering is order sensitive when using
      // percent range and no min/max/scale set on axis.
      // For example, we have dataZoom definition:
      // [
      //      {xAxisIndex: 0, start: 30, end: 70},
      //      {yAxisIndex: 0, start: 20, end: 80}
      // ]
      // In this case, [20, 80] of y-dataZoom should be based on data
      // that have filtered by x-dataZoom using range of [30, 70],
      // but should not be based on full raw data. Thus sliding
      // x-dataZoom will change both ranges of xAxis and yAxis,
      // while sliding y-dataZoom will only change the range of yAxis.
      // So we should filter x-axis after reset x-axis immediately,
      // and then reset y-axis and filter y-axis.

      dataZoomModel.eachTargetAxis(function (dimNames, axisIndex, dataZoomModel) {
        dataZoomModel.getAxisProxy(dimNames.name, axisIndex).filterData(dataZoomModel, api);
      });
    });
    ecModel.eachComponent('dataZoom', function (dataZoomModel) {
      // Fullfill all of the range props so that user
      // is able to get them from chart.getOption().
      var axisProxy = dataZoomModel.findRepresentativeAxisProxy();
      var percentRange = axisProxy.getDataPercentWindow();
      var valueRange = axisProxy.getDataValueWindow();
      dataZoomModel.setRawRange({
        start: percentRange[0],
        end: percentRange[1],
        startValue: valueRange[0],
        endValue: valueRange[1]
      }, true);
    });
  }
});
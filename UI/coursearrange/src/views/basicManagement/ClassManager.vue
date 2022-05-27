<template>
  <div>
    <!-- 功能 使用中 -->
    <div class="header-menu">
      <el-select
        v-model="value1"
        placeholder="年级"
        @change="queryClassByGrade"
        @clear="clearListener"
        clearable
      >
        <el-option v-for="item in grades" :key="item.value" :label="item.label" :value="item.value"></el-option>
      </el-select>
      <el-button slot="trigger" type="primary" @click="addClass()">
        新增班级
        <!-- <i class="el-icon-folder-add el-icon--right"></i> -->
      </el-button>
    </div>
    <div>
      <el-table :data="classInfoData" size="mini" :stripe="true" :highlight-current-row="true">
        <el-table-column label="序号" type="selection"></el-table-column>
        <el-table-column prop="gradeName" label="年级"></el-table-column>
        <el-table-column prop="classNo" label="班级编号"></el-table-column>
        <el-table-column prop="className" label="班级名称"></el-table-column>
        <el-table-column prop="realname" label="班主任"></el-table-column>
        <el-table-column prop="num" label="学生人数"></el-table-column>

        <el-table-column prop="operation" label="操作" width="150px">
          <template slot-scope="scope">
            <el-button type="danger" size="mini" @click="deleteById(scope.$index, scope.row)">删除</el-button>
            <el-button type="primary" size="mini" @click="editById(scope.$index, scope.row)">编辑</el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 添加班级 -->
      <el-dialog title="添加班级" :visible.sync="visible">
        <el-form :model="addClassData" label-position="left" label-width="80px">
          <el-row>
            <el-col :span="8">
              <!-- 年级 -->
              <el-form-item label="选择年级" prop="gradeNo">
                <el-select v-model="addClassData.remark" placeholder="年级" clearable style="width: 200px;float: left;">
                  <el-option
                    v-for="item in grades"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
          
            <el-col :span="8">
              <el-form-item label="班主任" prop="id" style="width: 200px; margin-left: 100px;">
                <!-- 选择班主任 -->
                <el-select v-model="addClassData.teacher" placeholder="班主任" style="width: 200px; margin-left: -20px;">
                  <el-option
                    v-for="item in teacher"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>

          <!-- 班级编号 -->
          <el-form-item label="班级编号" prop="classNo">
            <el-input v-model="addClassData.classNo" autocomplete="off"></el-input>
          </el-form-item>

          <!-- 班级名称 -->
          <el-form-item label="班级名称" prop="className">
            <el-input v-model="addClassData.className" autocomplete="off"></el-input>
          </el-form-item>

          <!-- 学生人数 -->
          <el-form-item label="学生人数" prop="num">
            <el-input v-model="addClassData.num" autocomplete="off"></el-input>
          </el-form-item>

        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="visible = false">取 消</el-button>
          <el-button type="primary" @click="commit()">提 交</el-button>
        </div>
      </el-dialog>

      <!-- 上一页，当前页，下一页 -->
      <div class="footer-button">
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page.sync="page"
          :page-size="pageSize"
          layout="total, prev, pager, next"
          :total="total"
        ></el-pagination>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ClassManager",
  data() {
    return {
      addOrUpDate: "",
      classInfoData: [],
      editFormData: [],
      addClassData: {
        gradeNo: '',
        num: 0,
        teacher: '',
        remark: "",
        className: "",
      },
      visibleAdd: false,
      visibleEdit: false,
      visible: false,
      page: 1,
      pageSize: 10,
      total: 0,
      value1: '',
      value2: '',
      grades: [{
          value: '01',
          label: '大一'
        }, {
          value: '02',
          label: '大二'
        }, {
          value: '03',
          label: '大三'
        }, {
          value: '04',
          label: '大四'
        }],
      teacher: []
    };
  },
  mounted() {
    this.allClassInfo();
  },
  methods: {
    // 提交添加班级
    commit() {
      if(this.addOrUpDate == "1"){
        // 添加
        this.$axios.post("http://localhost:8080/addclassinfo", this.addClassData)
        .then(res => {
        if (res.data.code == 0) {
          this.allClassInfo()
          this.$message({message: "添加班级成功", type: "success"})
          this.visible = false
          this.addClassData = {}
        } else {
        }
      })
      .catch(error => {
        this.$message.error("添加班级失败")
      })
      }else if(this.addOrUpDate == "2"){
        // 编辑
        this.$axios.post("http://localhost:8080/updateClassinfo", this.addClassData)
        .then(res => {
        if (res.data.code == 0) {
          this.allClassInfo()
          this.$message({message: "修改班级成功", type: "success"})
          this.visible = false
          this.addClassData = {}
        } else {
          alert(res.data.message)
        }
      })
      .catch(error => {
        this.$message.error("添加班级失败")
      })
      }
    },

    addClass() {
      this.addOrUpDate = "1";
      this.allTeacher()
      this.visible = true
    },

    // 查询所有讲师
    allTeacher() {
      this.$axios.get("http://localhost:8080/teacher/all")
      .then(res => {
        if (res.data.code == 0) {
          let ret = res.data.data
          this.teacher.splice(0, this.teacher.length)
          this.value2 = ''
          ret.map(val => {
            var lab = { label: val.realname, value: val.id };
            this.teacher.push(lab);
          })
        } else {
          this.$message.error(res.data.message)
        }
      })
      .catch(error => {})
    },

    handleSizeChange() {},

    handleCurrentChange(v) {
      this.page = v;
      this.allClassInfo();
    },

    // 根据年级查询班级
    queryClassByGrade() {
      this.$axios
        .get(
          "http://localhost:8080/queryclassinfo/" +
            this.page +
            "?gradeNo=" +
            this.value1
        )
        .then(res => {
          if (res.data.code == 0) {
            let ret = res.data.data;
            this.classInfoData = ret.records;
            this.total = ret.total;
          }
        })
        .catch(error => {});
    },

    // 分页查询所有班级
    allClassInfo() {
      this.$axios
        .get("http://localhost:8080/queryclassinfo/" + this.page)
        .then(res => {
          if (res.data.code == 0) {
            let ret = res.data.data;
            this.classInfoData = ret.records;
            this.total = ret.total;
          }
        })
        .catch(error => {});
    },

    // 清除年级后重新查询所有班级
    clearListener() {
      this.value1 = "";
      this.allClassInfo();
    },

    // 根据id删除
    deleteById(index, row) {
      this.$axios
        .delete("http://localhost:8080/classInfo/delete/" + row.id)
        .then(res => {
          this.allClassInfo();
          this.$message({ message: "删除成功", type: "success" });
        })
        .catch(error => {
          this.$message.error("删除失败");
        });
    },

    editById(index, row) {
      this.addOrUpDate = "2";
      this.addClassData = Object.assign({}, row);
      this.allTeacher();
      this.visible = true
    }
  }
};
</script>

<style lang="less" scoped>
.header-menu {
  margin-bottom: 5px;
  padding: 0;
  text-align: left;
  margin-bottom: 5px;
}

.footer-button {
  margin-top: 10px;
}
</style>
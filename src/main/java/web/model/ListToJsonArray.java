package web.model;

import java.util.List;

public class  ListToJsonArray<T> {
        private List<T> jsonArray;

        public void setList(List<T> jsonArray) {
            this.jsonArray = jsonArray;
        }

        public List<T> getJsonArray() {
            return jsonArray;
        }

    @Override
    public String toString() {
        return "ListToJsonArray{" +
                "jsonArray=" + jsonArray +
                '}';
    }
}

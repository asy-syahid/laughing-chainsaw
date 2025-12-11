import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";

export default function TechnicianDashboard() {
  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold">My Work Orders</h1>
      
      <div className="space-y-4">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
             <div className="space-y-1">
                <CardTitle className="text-base">Leaking Sink</CardTitle>
                <div className="text-sm text-muted-foreground">Unit 402 • High Priority</div>
             </div>
             <Badge>New</Badge>
          </CardHeader>
          <CardContent>
            <p className="text-sm text-muted-foreground mb-4">
               Resident reports kitchen sink leaking water onto the floor.
            </p>
            <div className="flex gap-2">
                <Button size="sm">Accept</Button>
                <Button variant="outline" size="sm">Details</Button>
            </div>
          </CardContent>
        </Card>
        
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
             <div className="space-y-1">
                <CardTitle className="text-base">Broken AC</CardTitle>
                <div className="text-sm text-muted-foreground">Unit 105 • Medium Priority</div>
             </div>
             <Badge variant="secondary">In Progress</Badge>
          </CardHeader>
          <CardContent>
            <p className="text-sm text-muted-foreground mb-4">
               AC unit not cooling properly.
            </p>
            <div className="flex gap-2">
                <Button size="sm">Complete</Button>
                <Button variant="outline" size="sm">Update</Button>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}

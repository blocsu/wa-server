/*
  Warnings:

  - You are about to drop the column `exerciseLogId` on the `Exercise` table. All the data in the column will be lost.
  - You are about to drop the column `update_at` on the `Exercise` table. All the data in the column will be lost.
  - You are about to drop the column `update_at` on the `Exercise_log` table. All the data in the column will be lost.
  - You are about to drop the column `update_at` on the `Exercise_time` table. All the data in the column will be lost.
  - You are about to drop the column `workoutLogId` on the `Exercise_time` table. All the data in the column will be lost.
  - You are about to drop the column `update_at` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `update_at` on the `Workout` table. All the data in the column will be lost.
  - You are about to drop the column `update_at` on the `Workout_log` table. All the data in the column will be lost.
  - Added the required column `updated_at` to the `Exercise` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Exercise_log` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Exercise_time` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Workout` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Workout_log` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Exercise" DROP CONSTRAINT "Exercise_exerciseLogId_fkey";

-- DropForeignKey
ALTER TABLE "Exercise_time" DROP CONSTRAINT "Exercise_time_workoutLogId_fkey";

-- AlterTable
ALTER TABLE "Exercise" DROP COLUMN "exerciseLogId",
DROP COLUMN "update_at",
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Exercise_log" DROP COLUMN "update_at",
ADD COLUMN     "exercise_id" INTEGER,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Exercise_time" DROP COLUMN "update_at",
DROP COLUMN "workoutLogId",
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "update_at",
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Workout" DROP COLUMN "update_at",
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Workout_log" DROP COLUMN "update_at",
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AddForeignKey
ALTER TABLE "Exercise_log" ADD CONSTRAINT "Exercise_log_exercise_id_fkey" FOREIGN KEY ("exercise_id") REFERENCES "Exercise"("id") ON DELETE SET NULL ON UPDATE CASCADE;

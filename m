Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572782;
	b=AKYvArEZTjLzY/N4U1Y25eUl61OQfBvRUdYAfqd/4el11KrZyqm6AmAK1T4lYslNGgaT
	 BSbSYK1P1n5DCiWK7DvzvWSNclM5PEjzq2utw094Rt129UVwxJ+kUc1GJ0tZaqgNKofUo
	 AMK5T6ZPNF6m0Fk4Eb5PzqQIB+YqX/BPFTgZLSHrXcDGVOXh0iR5DWU9WSzVh8j2ZOvdy
	 w8f+YQpKhGruXYFxt57Z7wMCpKPqtceGLvNZQdnZwHVa4qokFZ3m5yC3WMypSmJbipt+4
	 I3JZHAOs28OVlY8dR9MwFWaymrEO8L39hYJdvd5zQ0y4uNQLU1dPu4Xe0LXWdlPmTFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572782;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=uKOf/sWuocTr+7AtsLJJEtOK0qwIac4arzN8no/qmUE=;
	b=GvbbE3BM+aHIv04p3vCtt8ElAOkmRmcBxZ7YoTxCFi5OP/A83S5ZT9rtGLHAB8bg/pSZ
	 P6bhPuqmSmzkrOFtKv1kQwnkpA1gKzABwU/GcGehRooTC2kmq0nmO/+nn8XQcdLFPOTXh
	 UR2v3sFU7Ng1YrirBz4K5O6aPUJj0LjhwX6I23dunY3gp+0ah7ueiW4SwhmVHcPjGg0pO
	 7t83TQEN5ePSEP2uewhbtm223v6df2rwtTc0KTjJcJf15MlMgldOTM2C6qgGz9OrlOdhD
	 xYHARVkDHwqVIK1m6HmmXjdJesa325t8u5fAUL9GXOsrkG/DapLA6gvNfEwaa99ezvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QphlQCK8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3643B60A2603
	for <sophgo@lists.linux.dev>; Sun,  1 Nov 2026 22:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QphlQCK8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CEB1F00A15;
	Sun,  1 Nov 2026 22:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572781;
	bh=uKOf/sWuocTr+7AtsLJJEtOK0qwIac4arzN8no/qmUE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QphlQCK8cpyKZuXZE49sZvVNg4wC9zZbAZq8JggdsOIJ5/Jv2HOTHHVSr0SGZ0VfM
	 SGfAJrhIQjrkWNZd67JOm67gETu116yDg0Y8XASkdC0QA/KPSft57ElcJKmgx9sq8n
	 CI6zyrHdsnmPr4N01ivysUI89C+y4mjbbCXC+i5g3V5Hq5DjWt0sI6f38KF3/IjTUq
	 +rgjeOvteGPHVDbr8i7jkfzvIprxCsgDafSYnknEU9zUGJvnacnYVJV+/Bgs1ofO/6
	 uUWECZt8Y7dugr1aIceBUnZrRXbRHK0jqlPPUn5/02FKZLMujct1uqmvCxMnAXDvM4
	 HxQN66YfkYiDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA41C391AF9C;
	Sun,  1 Nov 2026 22:39:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357278029.2624073.4779038529304323110.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:39:40 +0000
References: <aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev>
In-Reply-To: <aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev>
To: Chen Wang <chen.wang@linux.dev>
Cc: linux-riscv@lists.infradead.org, soc@kernel.org, arnd@arndb.de,
 conor+dt@kernel.org, inochiama@gmail.com, sophgo@lists.linux.dev,
 gaohan@iscas.ac.cn, lihangfan@iscas.ac.cn, chenyou910331@gmail.com,
 andrey.lalaev@gmail.com

Hello:

This pull request was applied to riscv/linux.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Fri, 9 Oct 2026 17:23:58 +0800 you wrote:
> Hey Arnd,
> 
> Please pull this dt changes for RISC-V/Sophgo.
> 
> Thanks,
> 
> Chen
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v7.4
    https://git.kernel.org/riscv/c/5d299ec9395e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF3413C908
	for <sophgo@lists.linux.dev>; Tue, 11 Aug 2026 00:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786407408; cv=none; b=j3qm8r30g/o1XwnhyGNF0vvb6UMxcU5OUyHs716dqT/EoaMU9cpSOE+hHcSo0jwoeoepnYeAA6MlCaA/N9eaYsJufPIw4Y3w30c3jVMkV+myTJe5kjdQwD/b6loXR+Ntv/Rk8e8P1iIqJJ5UTi0iUOFFfx+NX01P33uG9bBNEFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786407408; c=relaxed/simple;
	bh=aiF81o4JtZMJmByAWxPE8HXBC1rwc332HcWAelUw1zM=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:From:
	 In-Reply-To:Content-Type; b=D9ffrd3zLo+p0TwlRq3y4TAsk4ndFBiosQCvjAIfDgRx7zlfl/Oy5SogG28I0nRSfXDsURXN1MQpqoV7DtJ1uUyRXsbaAcGcKRXhsPmTXNWWU6c8TMmF2jYqzvblLx8E/70VGqTv3nWM7xRXqmKKyAJvGwlAJZdIlZ3sNJ7JwMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=k8tSmVr/; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="k8tSmVr/"
Message-ID: <ca97f638-e2a4-4709-99a2-20f3aa458b54@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786407404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JAE0/+Ll1hkNvTFiyVRzFP+6iJlQt1zRR0oz9e4l0y4=;
	b=k8tSmVr/zEHsdMxA/7t0tl/9xu8xsudVHaspaFY6VJoWh0dclrpliuC5jH4W9OrXpBIsRb
	TBO4OhPx2VkegpKDb16cqVZjQLmfQPg0pLRbNzCGqnA+i2Kt/bV3FtKIn3VR53gLBfenq1
	YzOiMC+vKfIzK8wd9oW+/1vVWBN3enU=
Date: Tue, 11 Aug 2026 08:16:45 +0800
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Fwd: [GIT PULL] RISC-V Sophgo Devicetrees for v7.3
References: <178638063763.3872609.9920540210952957691.git-patchwork-notify@kernel.org>
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <178638063763.3872609.9920540210952957691.git-patchwork-notify@kernel.org>
X-Forwarded-Message-Id: <178638063763.3872609.9920540210952957691.git-patchwork-notify@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

FYI.



-------- Forwarded Message --------
Subject: 	Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.3
Date: 	Mon, 10 Aug 2026 16:50:37 +0000
From: 	patchwork-bot+linux-soc@kernel.org
To: 	Chen Wang <chen.wang@linux.dev>
CC: 	soc@kernel.org



Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 5 Aug 2026 08:52:02 +0800 you wrote:
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
- [GIT,PULL] RISC-V Sophgo Devicetrees for v7.3
https://git.kernel.org/soc/soc/c/545ecc3577d1

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



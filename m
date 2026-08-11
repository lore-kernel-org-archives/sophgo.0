Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F6417A300
	for <sophgo@lists.linux.dev>; Tue, 11 Aug 2026 00:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786407368; cv=none; b=nU1w7qbg3XBj5vaN7BiejNF7MMCFpZi/dN2OuUN4/fUbJHs8SXTNhuMIr8ImgZOXdeIjahwHypJrcCIYA0l+eKnQaWT+R1wt28z2RMmkr/0cMii2e8ujNLCHjZTD+SzCC+PMUr3grd6K6ka8MPh36LgQSoEER4wxwilyZRZxs2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786407368; c=relaxed/simple;
	bh=tS5jl2qbCNXJF6mPJFEWLReVNkbdCHVQ2yVE9T1041o=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:From:
	 In-Reply-To:Content-Type; b=pDeDWmvUu9A+znW1yFOHugGW9hVokJWf/I7faW9Tm6t4VJjnFmZnsvO8dZXJAFb1Ctf107Fhc/p5f/8CCxXWCus9yJBWqyE3zfED4qSr9L/5BgiDD5TmoENHIG+pXY3y3OYVZCbFJtwInY88dcHkD/WuTQaXvHO2/tnceyG4d5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T0+3Xmio; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T0+3Xmio"
Message-ID: <266f0f4c-21db-4b5a-a0f9-c5d707c522fb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786407364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rFsAgDg/1ZmpDqwb9SAAObQKLDTd2K4pMff4sGjacQA=;
	b=T0+3XmioJqIPbO2u8ezaRBLLkiQSQn97UWXFTgSHE8m4+94Vl/yhxO7fkoGVB/VF0rcMsd
	nAvZ8xEq/t5I08X8K2cjZmK+3u665zu78lXy4jQVBe5JlmXYi5eQP/9ytVenoSjyrwPVqJ
	cos5MXndP/dCdC3WXrSvZlLGvejnbmU=
Date: Tue, 11 Aug 2026 08:15:33 +0800
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Fwd: [GIT PULL] ARM Sophgo Devicetrees for v7.3
References: <178638063913.3872609.8369367317225821467.git-patchwork-notify@kernel.org>
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <178638063913.3872609.8369367317225821467.git-patchwork-notify@kernel.org>
X-Forwarded-Message-Id: <178638063913.3872609.8369367317225821467.git-patchwork-notify@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

FYI.



-------- Forwarded Message --------
Subject: 	Re: [GIT PULL] ARM Sophgo Devicetrees for v7.3
Date: 	Mon, 10 Aug 2026 16:50:39 +0000
From: 	patchwork-bot+linux-soc@kernel.org
To: 	Chen Wang <chen.wang@linux.dev>
CC: 	soc@kernel.org



Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 5 Aug 2026 08:45:20 +0800 you wrote:
> Hey Arnd,
>
> Please pull this dt changes for ARM/Sophgo.
>
> Thanks,
>
> Chen
>
> [...]

Here is the summary with links:
- [GIT,PULL] ARM Sophgo Devicetrees for v7.3
https://git.kernel.org/soc/soc/c/bfe9922bea4a

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



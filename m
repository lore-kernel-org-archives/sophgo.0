Received: from mta1.migadu.com (out-51.mta1.migadu.com [95.215.58.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF213EFFC4
	for <sophgo@lists.linux.dev>; Thu, 15 Oct 2026 23:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792108409; cv=none; b=PwtDSsotmQY8vp0e32tuI/noOvyPo6fdmwYBEQlegcGURlkaKKzphddKK4kl+MfRGGkRUpK5fbqhXt5xQTjBnleh1gW6toTbB9Qjlaix5DYH3j+EOZgkZ+37NLaRhtcG+9ul4aKL+8qPq+at4au0O89Zovk7izl3Tx14IqnItV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792108409; c=relaxed/simple;
	bh=FUpPXYfowSCUWW1Ifzz/TsytpfqsjiAGpIISXAFBqd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GqPgBwv9TaUw9giwiOavmJSlHeM39RU3MMweNXTgIcNhHfeQq1MMsQdA64k4QU2c5LTkIAuMjgBHnmSnQIaSuqfvxENNRgT7/Sn+GLqFeHXf5ZC0yDx4+5IYMrJXZ/wLz6AEqaqPUGO/ccS8sKpKtaPRgQh1V0AiesBowctQFLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m0opDYTn; arc=none smtp.client-ip=95.215.58.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m0opDYTn"
X-Envelope-To: sophgo@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=FUpPXYfowSCUWW1Ifzz/TsytpfqsjiAGpIISXAFBqd8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792108404; v=1; x=1792713204;
 b=m0opDYTnqBJ9MFsVUPfK4U7gZDDrCZWKz1DTTfcnHBCwCByMolybO5hRl2+oYIHAoeLX6p32
 F9IXfBwenRcGBRu0zF7B1mMkT0TtMWq6PvvrXb1LpQ54MzKmcGpTkOjOZow9PO+9cugJis1moIb
 QNIe8D2XgSdFScvtDYmR8Th8=
X-Envelope-To: sophgo@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id ba4637d7c08d0e1a;
	Thu, 15 Oct 2026 23:53:24 +0000
X-Mizu-Trace-ID: ba4637d7c08d0e1a
X-Migadu-Flow: FLOW_OUT
Message-ID: <7033a6bb-333f-4734-a3be-42b3f943d31a@linux.dev>
Date: Fri, 16 Oct 2026 07:53:15 +0800
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
To: Inochi Amaoto <inochiama@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
 <fa4253c7-3b17-4b20-97b9-eb37f218a4c8@linux.dev>
 <atCV8NsJc5Oatoo0@inochi.infowork>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <atCV8NsJc5Oatoo0@inochi.infowork>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/15/2026 5:03 PM, Inochi Amaoto wrote:
> On Thu, Oct 15, 2026 at 02:43:40PM +0800, Chen Wang wrote:
>> Hello,
>>
>> On 10/14/2026 3:45 PM, Inochi Amaoto wrote:
>>> Sophgo SoCs such as SG2044 contain eFuses used to store
>>> factory-programmed data.
>>>
>>> As for SG2044, HW automatically loads the eFuse content
>>> into shadow registers which are organized as 32bit values
>>> exposed as MMIO.
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
>>> ---
>>>    drivers/nvmem/Kconfig        |  12 +++
>>>    drivers/nvmem/Makefile       |   2 +
>>>    drivers/nvmem/sophgo-efuse.c | 176 +++++++++++++++++++++++++++++++++++
>>>    3 files changed, 190 insertions(+)
>>>    create mode 100644 drivers/nvmem/sophgo-efuse.c
>>>
>>> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
>>> index c36c2a4c2a0b..a7936dd65bdd 100644
>>> --- a/drivers/nvmem/Kconfig
>>> +++ b/drivers/nvmem/Kconfig
>>> @@ -465,6 +465,18 @@ config NVMEM_SNVS_LPGPR
>>>    	  This driver can also be built as a module. If so, the module
>>>    	  will be called nvmem-snvs-lpgpr.
>>> +config NVMEM_SOPHGO_EFUSE
>>> +	tristate "Sophgo eFuse support"
>>> +	depends on ARCH_SOPHGO || COMPILE_TEST
>>> +	default ARCH_SOPHGO
>>> +	help
>>> +	  Say y here to enable support for reading eFuses on Sophgo SoCs
>>> +	  such as the CV1800B. These are e.g. used to store factory programmed
>> Why is "CV1800B"?
>>
> This is an old mistake, this patch follows Jishengs's patch in the first
> design. But then almost everything changed and only thing for SG2044 left.
> This is the thing that is left to change.
>
> I am not sure whether it should keep this generic name as I see it should
> be compatible for most sophgo SoCs (at least it should be for CV1800X,
> by just change offset). Feel free to give if you have some suggestion for
> a better name

I raise this point because the subject of your patch indicates it is 
intended for the SG2044.

If you are simply using it as an example （"such as ..."）, then 
specifying "SG2044" is sufficient, even though, based on your current 
explanation, it would also apply to other Sophgo chips, such as the CV1800X.

>
> Regards,
> Inochi

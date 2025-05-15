Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BF328C852
	for <sophgo@lists.linux.dev>; Thu, 15 May 2025 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300325; cv=none; b=IrIQ9PDZEXPOV2G1/K/lSHbHB59OYh1rmVwjRzAT25Ia7/HIq0TMsIMj7UtoAebzhNFmNWs0LcJWBivFPw4xIY/5HplyKMBvXWh76G4OuzceEfbihbKw4V3GZaE2yDRfMDPe4DMA7EpF84PlgAbBMbIbB0skL4cPI8Gmb54phOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300325; c=relaxed/simple;
	bh=Y8fh0ydbwDFuT4JP0Uktyo5VIuBqssqojenovaU59/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RO7y30XUVZDXudll4mBXuldNRn08cIjUxeWXVSdP1eTARvT3i3EojEMZ7294BYw2vHb6pWiJrHSNRW1Z57YaSk7cNOBz3/xHQYggsqBSBB75k1CeDm+iO0VuZHVzdZ3DHQpy+8m2mrug5FZJprbFayAILQte2e1nYEU+NmWxkPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nycdbw+H; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nycdbw+H"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442ea95f738so4914875e9.3
        for <sophgo@lists.linux.dev>; Thu, 15 May 2025 02:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747300322; x=1747905122; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CAE9bz2isgxzUGbrKGqqEdeq1PEN+8OwnZGGftLgteU=;
        b=Nycdbw+HpBs24ZfH3sLdcZnZTbtEXaNwlatmxiNwB50NfPdsqDA4cJSIGo/KoBjUBy
         7mT7Q8OFeFeNuIgWvo5NTDaHTEunHpJpz2nXYVSAXYN7V69Pmm/7ASNA0D6c/a3W/eZ5
         tTOKxhmJcW8CKX0cxsdUvUYbH7pnElMv0wlUkm6721PE2HqLMbOEJv6I7U98RwF9eUGW
         oF9/taz2MWL55BvZY5mRXMTajAgeH5J7zOf1B7dEyWq9OTTHAWzP5wGYUpAZclK3KYAN
         wYAO231z6oaOsu1waY7qDWS3sgveGINh1vX+8EKOpekR2FgdNMGuSMsYZCUu5B3j/6pr
         g2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300322; x=1747905122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CAE9bz2isgxzUGbrKGqqEdeq1PEN+8OwnZGGftLgteU=;
        b=vElYqdHbej4B15QS53z9mQy1o8CirzsLYuj3CHNiVYl0lIquMcW4BsJRDQIf13C50c
         sXHCivNKHpGeHusnAeMhKMK/4Sh/MumoC+irx4OvPf8O9takwIQyFhoiqXwDpzf/NNQX
         TxyJeU9O2StICoVnhoN1+ruYE5OeKjcnQs6QcW6klT9h4JQjdMixWmXCfJbiyQ0wJKwi
         JyYH2orwIUBw3XpEirGPxwTsDUiPyCOZDnwlxnYHwAfr0KVUhqVkLLIUHfqd0K3wl0DE
         nV+SxwPSAdPLuJtW4g/7BTErfElinqrxANqc+08ptzKRT9iuogpsVdtdFLkjVTVOfMKM
         2MDw==
X-Forwarded-Encrypted: i=1; AJvYcCW6NWN00fR72zwEfhwnaJPyu4Zn6eIy0RPpqLvMZL/RVIrXm2gbivPFL6GyhCdixJhMvnfg4A0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMjtr6/F/lZARlGbREpPfqSEvZWLfPyH6gbbzd+1/sIo9Qdalj
	xhdnMj52p2xJr37KvIfmac6nIGEuzNYcP+20OuGoaKwKnU/w8dGehMVFADQVJRk=
X-Gm-Gg: ASbGncu2NrAgmoIiYnlLHIICD/+BaaI64uVvwi2a1h+LCzidx+O2WRy9TU8Pq9ZBbq6
	ucjJVdDPNbvhN0c5nSc168lOTTzGqYqLsAlwh5Ng1OkPD8hnwMlTZAUxVrJU1vdYnCUrQPWxDa5
	PeK92XH2RAajOmkFXWnsdHwzzUVQCmjAZOdvizwZMWL9/XKJNtlTwTBIjH04OtZ2/zvHyCMe4bt
	TQxZmwGLNDYAOxRDPoLFrBXEqInV+nG2gyW7k0iroh4Eylz5ap77RGP/w+Q4m79htLiiotAFLrC
	dTLUNZtXdbY9pq9/kD5PnQEhosxkISPuA0SSKH3Y4Yt4exRDY07ElP/5eBDYO+xUaiqd63aCWXo
	Vi32Xc2Qleamp
X-Google-Smtp-Source: AGHT+IEiWqZK+wIF0dIQPPNEPiVIMFChIw3pA6T9sTYgeSc0xYst5cv/piO7TsYycRsa/pH81nx0gg==
X-Received: by 2002:a05:600c:b91:b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-442f2177567mr56412345e9.27.1747300321871;
        Thu, 15 May 2025 02:12:01 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57de100sm21837759f8f.2.2025.05.15.02.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 02:12:01 -0700 (PDT)
Message-ID: <726e96bd-d4c9-450b-9161-241f05d3d82f@linaro.org>
Date: Thu, 15 May 2025 11:11:56 +0200
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
To: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, ghost
 <2990955050@qq.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-2-inochiama@gmail.com>
 <aCSmNRTVXQ51xj0m@mai.linaro.org>
 <MA0P287MB2262A447A98778BF4BC3DB2BFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <MA0P287MB2262A447A98778BF4BC3DB2BFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/15/25 02:03, Chen Wang wrote:
> Hi, Daniel,
> 
> Just a kindly reminder. There is a v2 of this patcheset [1], and I see 
> [1/9] of v2 has been picked by Andi [2].
> 
> Please double check if anything wrong or conflicted.

Thanks for the heads up

I think it is ok, I have the right version in my tree.

If you want to double check, it is here:

https://git.linaro.org/plugins/gitiles/people/daniel.lezcano/linux/+/refs/heads/timers/drivers/next


> Link: https://lore.kernel.org/linux-riscv/20250413223507.46480-1- 
> inochiama@gmail.com/ [1]
> 
> Link: https://lore.kernel.org/linux-riscv/ 
> egkwz23tyr3psl3eaqhzdhmvxlufem5vqdlwvl4y6henyeazuz@ch3oflv4ekw7/ [2]
> 
> 
> On 2025/5/14 22:18, Daniel Lezcano wrote:
>> On Mon, Apr 07, 2025 at 09:06:06AM +0800, Inochi Amaoto wrote:
>>> Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
>>> compatible string for SG2044 SoC.
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
>>> ---
>> Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

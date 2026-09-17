Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D652C031E
	for <sophgo@lists.linux.dev>; Thu, 17 Sep 2026 03:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789615628; cv=none; b=c2MgsqOl2K6bYQ0QWOthqLa1D2cu1bgC44ZOP/nZ4yuq32Hbp0MeefR5Zjl2hvZEOCKSyt6SbffrrbPiFCJojTLgaFTIBGvraBSZZv98HMBrDn2AwwgaRNIfKZWvSfclEy7Q/QOlE0IWHNzDG4ugrSEZSgFuBr0kVPOADtJA83Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789615628; c=relaxed/simple;
	bh=R3FAfBMCy0I3rYNbY7ljz1l5sVG2klBi7lbMe897t6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIzjWPPILunkptK7x8eQOyaZXlK9oZ5h405UsuAceNysdvG+bo55B8MgaJ6qNhJIZKGFKSTKUYOFraQacaM93Lm5eo7XqbjvgWjVhQb8RAHAbMXvANUkIdzwYVtNjK1Cl5ZVLunvFFbKsP3+p3Ja/FYGB29BtcVHP2uSslbjV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEc0YGly; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEc0YGly"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so2662265e9.0
        for <sophgo@lists.linux.dev>; Wed, 16 Sep 2026 20:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789615623; x=1790220423; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JfZ+gBA8a1DG0OUmX7Tsw/OgchSGtEjjMWjZU8Wx4UA=;
        b=fEc0YGlybp4EnxqzDlvAlbkKEj9fVy2gHlQ2ssFkni1bPH72pZXvDcjXn4kDfskvaS
         htTeDiPep4pqTPtjaTnTSP+xsZGVl6gfdFc8Iq3bol7W26nfDIL45lHWS58Aju4zAoCq
         YUi4WJmwLNbYgtvUnbunfpUbCWl9rpkkCTQ68pPRXsjThhh437CP0xd+qyCaIucBU1uy
         mPeDe9FN3zDFV8hQL4VdxwsScolxIpkZq8FCmuwMHtL0p9rc8E1n5VEFVJ9tQfoRJwEC
         RItspnNqzntKrq/c1UKiPnvL+JZMohlXIlUMvzluNOvUhP2HFNjs68D8qjoLJwR2oMHb
         FAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789615623; x=1790220423;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfZ+gBA8a1DG0OUmX7Tsw/OgchSGtEjjMWjZU8Wx4UA=;
        b=gDVQcVblMMJ7hIA4iWIJleszD6CTMGXrALA2yaAPJnA/puTC5Wub/usqndkjOI8Qc9
         ScAqrKudty1c6aZG41J2vDDd7gvwUYdb+COS5pFM37DncP6arCX1WTgWp37WyAnL/vKe
         ttrtQxDBMR62uJUIxbu2GvVaYk4s/MWOqA/LIusOuiErwGtHT3noRZA66EhvrgRAJj8M
         IzIvPe/S5caFH2dPRQ1P6nfcXNq521yw+fmEIh+8NQHLlilZIjM2hROpqpZw0bhJL95F
         PLmifaywnQLXvtol1tiC5x73FuBniDQ3QQIqw6j2QrR6dWxLEBxUPa1nc/tvQd0DRw9m
         nv6w==
X-Forwarded-Encrypted: i=1; AKwUvBz2xnyK5IqN7P4sH6y6gxzZDp1wloS7CJawHxRhrbcmVwa6Y6OyeQ677EqUtU4wn9VeA78KXfY=@lists.linux.dev
X-Gm-Message-State: AFuF++n/hk4nl9Ot03seZw8Z6xMHSxS0KlrzOufbtVNAQKRViO1r40Qp
	JUkbsr0FNiai5rgxm0+Ua+P37YG3tedq1fHR1jc3zcyeF9ecAaMpICgY
X-Gm-Gg: AYBFou02pCq2ohF/0clfahQfIoGWAOIuH4BpFZ0fgxhg4iEmFKBv64Jfb3lDvRMWOru
	60IESeUTTz83RH5t9nzftZktNBfsgXYZkCKZYQXzHlbkj0Cv9HVfYUcNIccdk11cYDq1k/Xf2Xs
	Fjzd4LAjd/bGDDrgNIFANhpU7xW8NlwhJVKEZH4RU6v1He+QmdwiMBch/cDu2CZ3Q5q4tioKxg7
	HIMqAPn1shBnhXr1cr7JKkhH/k/3ll3SGVNDmjNqfFzkUJvuUGMOA3m7cpZdxHklycoMSxN5L2H
	bwocMA0qlPaoNupgBNGhzR0+oNXbv5jKIEdetA/QWhAp7NojfphII1y653WrITHgGd3hdyQiXJE
	EN6shhDKWonVJDL0TJOXCWNOPTJShxez0t8UEXsJkZw7MZQSnFStuCZuATIWA8aAKNHrY2GcTXa
	I9Y8TC4mugFIafKx7iSZbKPOOUvjhPnt/uB0tThKGjfJc5jClZL18RN6Qkyd41vS2WJGmPeayVt
	xOwYKciYkWG5mrEd+pCvlcco+oxuWJNBxCCV8vOuGN3T3jrzPxQ9/8VHMimeupvlAJCs2vBYKaP
	QlPg81NI7Jim0mnEXi9Hd/gxBhtOVKJzDo0f6GG+2vp3QiMRGLuhrESUDrtgMD9lzYfI1uJSg1s
	45Og=
X-Received: by 2002:a05:600c:8b78:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49ebb4297c4mr61135065e9.24.1789615622470;
        Wed, 16 Sep 2026 20:27:02 -0700 (PDT)
Received: from ?IPV6:2a02:8388:e6ca:5780:b097:7d16:9a11:ca28? (2a02-8388-e6ca-5780-b097-7d16-9a11-ca28.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:b097:7d16:9a11:ca28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm11432549f8f.35.2026.09.16.20.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 20:27:02 -0700 (PDT)
Message-ID: <e2c853c4-34bd-4f2f-8c8c-a05cc4442a98@gmail.com>
Date: Thu, 17 Sep 2026 05:27:00 +0200
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory
 for RTOS
To: Inochi Amaoto <inochiama@gmail.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yao Zi <me@ziyao.cc>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>,
 devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
 <6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com>
 <aqtKAuoVSCxcts52@inochi.infowork>
Content-Language: en-GB
From: Andrei Lalaev <andrey.lalaev@gmail.com>
In-Reply-To: <aqtKAuoVSCxcts52@inochi.infowork>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Inochi, Samuel, Yao,

On 17.09.26 04:02, Inochi Amaoto wrote:
> On Wed, Sep 16, 2026 at 12:10:23PM -0500, Samuel Holland wrote:
>> Hi Andrei,
>>
>> On 2026-09-16 11:06 AM, Andrei Lalaev wrote:
>>> The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
>>> Reserve this region to prevent Linux from using it.
>>
>> If the FSBL wants to reserve some RAM, it should modify the devicetree at
>> runtime to add that reservation. Adding the reservation here creates an
>> unnecessary ABI surface between the FSBL and all consumers of the devicetree.
>>
>> Regards,
>> Samuel
>>
> 
> This is fair, and the fact is that the current fsbl can disable
> coprocessor in its configuration. So I will not take this patch
> and maybe do a cleanup for existed devicetree if I have enough
> time for it.

I guess you are right. Just thought that it might have been mistakenly
overlooked for Duo-S because both Duo 64M and Duo 256M have the same
node in their DTSes.
If it is okay with you, I will try remove this node from the DTSes for the
64M/256M variants.

Thank you for the review and sorry for the noise.

 
> Regards,
> Inohci
> 
-- 
Best regards,
Andrei Lalaev

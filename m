Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118211E5B71
	for <sophgo@lists.linux.dev>; Thu, 10 Apr 2025 05:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744263941; cv=none; b=OmDXON0ELLPue9GvmOm97a991Pq5QcMOJg868w2Y5Ey6vQxltOLbos1h3GxOCciT9nZAYrH/ySFaBxLfCDzGWMzKQb2jBCvGDVJxEri0X7Byxzpt7OHEKRi2XQ6CpnEdkWfHkJvstMxOPhL4B3ooU4bBqc6SxWaQNB4hmmwo608=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744263941; c=relaxed/simple;
	bh=jHaEtzQVLOQhENDlIGBE0r9XR/xjh2shXjUrdPBQg3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijH2JInAnYguR4Bt3d5MG4nSdVzFN2LiAFVUY8TUl4FIq5MHbobsfBjHcivfRcUXPuxEx0Y3zPRdB+VtWmHN6oLRGitZRuQRs2EnQib9hNE9Ud0R0NiFuQE/WjJAbSgRcmL0dzsFKYnoNbvnKZ+wAB8DvEzDOX283miU/E4pGdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkqPhxjI; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkqPhxjI"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4774d68c670so5830141cf.0
        for <sophgo@lists.linux.dev>; Wed, 09 Apr 2025 22:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744263939; x=1744868739; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1dSDpt8yORaoTmILVfEV+qWHE1Kt5hrousefB2rwiP0=;
        b=YkqPhxjILbV7clesSOqCMcQn/WQCCixClUbR1jRZAQagHCvowWWYHx4hhGMAY6faoC
         2pZ9ANRJGqlpWRnprD0yC2eTR7pumcjFRAIDNahlon8y4Zos90rfp2mqP2nzZYfVAgbb
         8jpW/GRr6UXpFye3MlznzMorN4UX8QIlx1OXIQkOP0t04JcN7cuuDKzHT2B4zo2xDK2l
         ALzC0d25n88QNo2aQnJnDONre57zMeBul97Ykx7TK7qDCF561BC/j1AK73uvCirTGR6c
         CrNhQO3TKLPP9MASSCDgnIM5wd/E1smcffcAjDGD31opdujm96VfmtNb0MpuM2XwBq/B
         MAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744263939; x=1744868739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dSDpt8yORaoTmILVfEV+qWHE1Kt5hrousefB2rwiP0=;
        b=MLxFwHqVrPMUKxE6hLAhBSNqGlfwei/AmiG02Y5PENHXFYfCct/PVMVKbSwUEDJSge
         JgUkCyScuWPBnIo5ablTKIIDW+ojUWNZ4+dxNtPmX4qvUE/oj1TyEGJwZ7OupdRVQHCC
         P2Awx61Wa8lPCEqXOUnYS7a7nBFUJK+CAYXylOOVFhnUYhnwg4SSML9n0OVcTyjNt5v8
         lorsOzk24N9ZsyNn0cNcnvK8JiTVx0nsFWQshgl5I0ulKGcZ14B+3ls29l37l/f2yPvn
         oIzb4Y8mZSv96BEvSjUWgDsd+c0V1sK5N2GfnVlVpK3enW2xp/70KmVJoq+mPqJyqXmk
         dcOg==
X-Forwarded-Encrypted: i=1; AJvYcCWE0AM4qeRFImYReW+9AWsOYOqAsBPsCfVWASpX/tgBsC+YL03otbRZ+JDfPXuoE9yF1/GGVJ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRlSULZmGMVY2pGObyB8Gp94aHdOxdrAmsFFLXrJqnDDn8K67W
	/bUWkDWX2hsqRpiPGDS8CMqYjSjDsziT4cDKY5GME7bv3pKhkU7n
X-Gm-Gg: ASbGncvHpVRm0WxRLDpx2YNTA383UePuVOpOmRXFLuXPZEXQzkmHTQhwd/y6ElpOscu
	eIcCzOQG5j1VFO/RiJhCOn4116GLgtxPMmjx31eAffk8J9AoLHgvd4WrutCC9nDNvbG63/BaY6m
	1+5SmOdwXY/fumy1oUWoc+AFeZFEyeuynfBqUhLfyI0SlxoSRdlcCpoyuMhzeg4UFYnWzdkxfMe
	yDdatx9Tl+hgBdfIuAQ3aZmxAzR23mIIukK+ZKGj7h6NPOlaHrrq1vEPkWLjAaXcuQ+PE30nt59
	Z8WOHFMiT4nP8EP+QkPvmDglTUA=
X-Google-Smtp-Source: AGHT+IHWpkW6hRR/DBsksx6ZJqR4lJbOCUW1b2317akbtc9j0rn0qJX08BWWlLDmViJytQmHCxBIVg==
X-Received: by 2002:ad4:5f4f:0:b0:6e8:f17e:e00d with SMTP id 6a1803df08f44-6f0e5aa6ce8mr23639886d6.14.1744263938704;
        Wed, 09 Apr 2025 22:45:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de95fdd1sm16451946d6.18.2025.04.09.22.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 22:45:38 -0700 (PDT)
Date: Thu, 10 Apr 2025 13:45:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Yangyu Chen <cyy@cyyself.name>, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v14 1/3] dt-bindings: soc: sophgo: add RTC support for
 Sophgo CV1800 series
Message-ID: <3m3amtjnqcrice2tfxw2ky7f65u574yi7crmcg7j7q3tnkk3zp@k7a5alzdbffb>
References: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
 <20250315224921.3627852-2-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315224921.3627852-2-alexander.sverdlin@gmail.com>

On Sat, Mar 15, 2025 at 11:49:12PM +0100, Alexander Sverdlin wrote:
> From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> 
> Add RTC devicetree binding for Sophgo CV1800 series SoC. The device is
> called RTC, but contains control registers of other HW blocks in its
> address space, most notably of Power-on-Reset (PoR) module, DW8051 IP
> (MCU core), accompanying SRAM, hence putting it in SoC subsystem.
> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changelog:
> v14:
> - no changes
> v13:
> - Moved bindings from MFD into SOC subsystem
> 
> v12:
> - maintainer Jingbao Qiu <qiujingbao.dlmu@gmail.com> -> sophgo@lists.linux.dev
> - dropped Reviewed-by: Krzysztof Kozlowski
> - link to TRM
> - mentioned 8051 core in the description
> - binding is now MFD, not RTC
> - added "syscon" compatible
> - added "interrupt-names", "clock-names" (because of added PM/remoteproc)
> - main compatible "sophgo,cv1800-rtc" -> "sophgo,cv1800b-rtc"
> 
>  .../soc/sophgo/sophgo,cv1800b-rtc.yaml        | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml

LGTM.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>


Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888241F4CBF
	for <sophgo@lists.linux.dev>; Wed, 14 May 2025 22:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747261599; cv=none; b=DfgJNRGpOjIwJn48+qg3Dp0QjkNM6SddLzCj4OUbiG2GzydLShh7mM0JutbbUdMKB6eePyx1AEJypWSOKaIOsK/3AO0ZeD5eemL493vx6Cl0hpXpZW6QpWZayYhsJnbIJ70OaUz/vS59Miqh5yHpw2FCA0xmN6gggSXiy3jNUr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747261599; c=relaxed/simple;
	bh=e318nA+l2faX+8mEcOPz0nIXWQIzRPQPZ3gt/UuoOX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJ4PIr8ZakdcNk2j/hjB43jnsccGpReJb5JOmOJzGxvejCWdgpC30oVYZSE7/yvvOEMxjW5kzYAcAicrvvbC60oKqQY1os4fI69s0qBWqzEP0KZmtbNoA9PMiFhWPznXiV9aiEMH2Vti28VO0AUnglvjMar/TS1J5k9OVxbyvx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9Aje2l9; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9Aje2l9"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c9376c4bddso28840485a.3
        for <sophgo@lists.linux.dev>; Wed, 14 May 2025 15:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747261596; x=1747866396; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c8WzUMbK9qDOEyYdDVvObbmZCXxUEIqd+QHrspXvgLY=;
        b=W9Aje2l9xZjz7EkscXR/G/hKDMEOmq0DBNHKL46cpBuDuWdzfabATkKP6k0bMwnEH+
         J0943x3FP5NsmHx0oF6hYXg0roS5z/DXx7zTFikH+ilKFn24UtDS2QP/78+oeI99Kqn/
         aTtWV2aWIsmy462F3cqBilmB/A1zwyfvM+eZ2hoCCp/yLm+BlyJd1h28PvyWkQD7yzOX
         lbM+yGf6zni1jREH6zyZiie3iSjNbBxfiQLJDfa2ALdgY7WvruM5GWycaw68InVzlXfZ
         BrHkGSo1e9Nh2ecEaSjIucgzJkNQCXOWVJSfwCtNiTrU01QKUajWJVTr1iGhyNjxKyZq
         y4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747261596; x=1747866396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8WzUMbK9qDOEyYdDVvObbmZCXxUEIqd+QHrspXvgLY=;
        b=e5NqXnEM8keg0MHQv1inHx05mtTIaRLODyW+0hVhxb4i4cIiPOonJ9jT/vsXxdfFS0
         CDXxRX6jgVibFUMtzmHT1sUWKuSSgMeNi4fe7TTuRY+dL2/HYw6ON5z9Mbuc47pr5TWJ
         cP7DP3xfP0YF9qhWua+68J5aqTxVoyYOdojt1ZEUHnMtbOP2FORsMARp6ujEOvqSMgPz
         Qm5N7jJ0fPs3COMp833vwHVpbgR5L/WJOTw885EHQROxhs26d9vroBJttXA0Eklfm0FU
         EvUAhgCIN0DS7Oj5NnuN+FGW2sjMj7DRfUYy55uYX/JQk3vo1vLZ81Qmc5YMnkCBuysu
         Q3xA==
X-Forwarded-Encrypted: i=1; AJvYcCWmuqO7bt9yk7YhZDo73CoXEpKr3VJLsnSrzoXX9PEqC+TZhqmSRlE52o/IkOLohx2ibvbc574=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgRb9y0CtR3oT9DO0ixkfOwKWpTc2PVlOwWvXyKAQcPdUIXFD2
	lNofGz6ozaBxJQgoXGfv5BfMXt2SXvFLrj/r372qjWNffddI0bzF
X-Gm-Gg: ASbGncuJKUvwOvEJwAChN8lylJHnWmsUPJUelL+T1ha/E5/uZEIxI6x26Ow2fWcA2l4
	SWJ3P0LOyDPMWJe6kfvHAM6xnn33XbfS9WSNLICdtDffpAuUpb/59cR5w6ifeVYZB4tOMvWsw79
	6oBn8IBFa+F14Yr/AVx/FgVX7S8IfYKosCWYfq7Iaxvu32qdcfd9C42Lh/zCwaPUQVCC8OsNnlu
	U+DIhUNhWDzNE+uHbLd/NWaWwUVNk28O5ztuomKclWGv1nHhJ04gUrjjmW32bsBI+fhv7TtV4wf
	DN/UT7oPSihJHglqZUP3f+joYzU=
X-Google-Smtp-Source: AGHT+IFCPVi/HY6nkbeTe3GAvpoQfv29BrlN1iWGz0H9o77nmmRTrZnt07gCTVHpLkHuJ4hlKEVttw==
X-Received: by 2002:a05:620a:2904:b0:7c9:4d96:24ce with SMTP id af79cd13be357-7cd28846e7emr739361085a.44.1747261596342;
        Wed, 14 May 2025 15:26:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00f4e0f3sm899305485a.16.2025.05.14.15.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 15:26:35 -0700 (PDT)
Date: Thu, 15 May 2025 06:26:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] riscv: dts: sophgo: add more sg2042 isa extension
 support
Message-ID: <qz2kywcmxx2ub4bycso3y4qodiaeddj63nclissppy5morsjqt@jci4bapl2afc>
References: <cover.1747235487.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1747235487.git.rabenda.cn@gmail.com>

On Wed, May 14, 2025 at 11:15:49PM +0800, Han Gao wrote:
> Add xtheadvector & ziccrse & zfh for sg2042
> 
> Thanks,
> Han
> 
> ---
> 
> Changes in v2:
>   add zfh for sg2042
> 
> v1: https://lore.kernel.org/linux-riscv/cover.1746828006.git.rabenda.cn@gmail.com/
> 
> Han Gao (3):
>   riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
>   riscv: dts: sophgo: add ziccrse for sg2042
>   riscv: dts: sophgo: add zfh for sg2042
> 
>  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 512 ++++++++++++--------
>  1 file changed, 320 insertions(+), 192 deletions(-)
> 
> -- 
> 2.47.2
> 

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

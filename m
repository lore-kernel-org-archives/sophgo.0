Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892C9188596
	for <sophgo@lists.linux.dev>; Tue, 10 Jun 2025 01:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749520227; cv=none; b=U//lC4QNW6vjB4MEEIwdftMKSdlleKNT1ZSp4wZVwxg8lEzbX2o9K0FZD7+gc68NEBg4QpH7cQGJ7fACFe4M2LRZ4MrVBPUpRzWAQHcPvJYzxjEBMY7rQgiZ3FVaViXUEmnsuC7EpgZDZk1HJFhNHNeLdefJ/6ApuDhTgOL26hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749520227; c=relaxed/simple;
	bh=LsztCVXZZPbLzW5t60Ca3HvRdV7GOesUL5uH8ho9IOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F++HL3/4RbhzFTW50jMFCjSNplqRJnyjEnRisnaEMLnVnbntPqffKBfMc1XyvQI8RT+9wzv1sBBvVCsPXH22mUzixTT0owJKWslie7Uu8f3f9RhtYRuq8gsTQcrkY2T62peFvKm9U/RPbmBk/lt52AsrQiuS6GHlGCogVURKDSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SExV39kV; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SExV39kV"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d38cfa9773so238792485a.2
        for <sophgo@lists.linux.dev>; Mon, 09 Jun 2025 18:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749520223; x=1750125023; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PJ+k4mMk424f8gSBCF0DcdgBmLjrlumxnw+t8TKS1zw=;
        b=SExV39kVuQ4uRR2Ljjhnu1dZ88B5JMnBU0sWpJ18+f/cOQ8xzpedWGpvSL2R2DbO/U
         m3h0EhgUYLU82aZJI8nCWVvCK/I0Gq6xeQP0QXoVtGGtiSMiBZeoK1onnyNzQhxfdOeU
         6f8plI0xkKGAQpDPDx0e/okm4iv5RQCpwc4oO06eUW7CneyMQFLBnwaz2bqSjNWRFG3C
         mZCOkKwxaSxxcOiqeHM+akafjHJWqApiw4kasZbuL1K4Xx9eQ29pq8jTiyGjauo4RDE9
         k4cqWJ9wIluzLELFIfSg1sxl0E5AQ8DAz7mnTgBBY0Kz5s7zt3WkHrXNz3VK3wHImSAr
         35Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749520223; x=1750125023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJ+k4mMk424f8gSBCF0DcdgBmLjrlumxnw+t8TKS1zw=;
        b=tAflVXAqMFuPLrCtIoVWaOoKluxS2fqakdSGxt+E/qfB8+LZSTD3y5A8mCrOu1U1FU
         TVxRhbd+Zmt7r3tUz413/4HwW9kvniypGx+/I5PHxXyShMUw00I8dOuhC9L5Ay/5zfF+
         IYFriOmYqzwFUry2UD4UIkEjuFL/M/kWN9/XlifuCCT5JjFJVkAxk/KypRNr8CNm2Ksw
         qaLtxMgY5hr/WVXzNj0w3QTY4GoCLGuR5D4GB3CXIGpDCohBuYJIMfmZvUNDIaCgl56o
         TG2/FIX926HDraOT9WeDpfkIC4Xv89jGlZYfKd8fuhOrx0Gw6PwgCwncGavtbvNse7QH
         jk1g==
X-Forwarded-Encrypted: i=1; AJvYcCV9XTBC6s9mDoJ758gA+LKgEpewIxAoahxkW2m2j09QYuttS3n93Vg2k2TJvcjtC0SzPBbO9s8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCMUq/FUiowk/deHcIVxHceU4GYX2R/HMXFaomhWK0OAp8aAsu
	ZTYTOpeGjft4qfg/2L+gJTVyYwSCTqZCmX9KpU4+wqELQq2zpbd+oWaV
X-Gm-Gg: ASbGncsl8WWmyAq8IrxDawMqiAWpUGhj4uV8tZiG+OhhcKrTZE5IgJ4okr/QZJAP3tS
	bbrQQ99CchErN9iKo/+sv/FBwf5adlI3TKJW9c72BM5L7MH1ypS5qGwfOYDBGaDYiT1yhjJTU7b
	u0/ZNp8grKVk0BV2oTmvVrbbTFLBWkDSdsuvOBmxNjc+BkoT4GAZT6kYvg1U4D1dG9FDmMK3iqR
	Sht7dMMCokoIMpJnkX0lnCTqLtw+04WoeTFplBprQziWbli451ZEWLvHIHfWcj8EiRHdDPp4j/D
	Qimp0/OBlsAVx/b5lamWTeBDycO+YHwDsobJfA==
X-Google-Smtp-Source: AGHT+IGMgWEajIStyhq4ZxgjEnDpGh/DhsVjHF6fVJlErUi/6EmExzbw4J5ZZ8yxGUZo19XRc5vv/g==
X-Received: by 2002:a05:620a:400c:b0:7c5:962b:e87c with SMTP id af79cd13be357-7d39f62dad1mr139939085a.44.1749520223312;
        Mon, 09 Jun 2025 18:50:23 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a61d730sm618530785a.82.2025.06.09.18.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 18:50:22 -0700 (PDT)
Date: Tue, 10 Jun 2025 09:49:16 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev
Subject: Re: [PATCH 0/2] Add reset controller support for Sophgo SG2000 SoC
Message-ID: <nztbl7ki2pmgb4nrahdyam6yeu7xtlv7lgfuqcl6qzibbjqceo@osltqayu4meg>
References: <20250609230417.620089-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609230417.620089-1-alexander.sverdlin@gmail.com>

On Tue, Jun 10, 2025 at 01:04:13AM +0200, Alexander Sverdlin wrote:
> Add DT bindings and the corresponding compatible to reset-simple driver;
> provide the include file with reset lines enumerated.
> 
> Alexander Sverdlin (2):
>   dt-bindings: reset: sophgo: support SG2000
>   reset: simple: add support for Sophgo SG2000
> 
>  .../bindings/reset/sophgo,sg2000-reset.yaml   | 35 +++++++
>  drivers/reset/reset-simple.c                  |  2 +
>  .../dt-bindings/reset/sophgo,sg2000-reset.h   | 92 +++++++++++++++++++
>  3 files changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2000-reset.yaml
>  create mode 100644 include/dt-bindings/reset/sophgo,sg2000-reset.h
> 
> -- 
> 2.49.0
> 

I think use sophgo,cv1800b-reset is enough, there should be no difference
between them.

Regard,
Inochi

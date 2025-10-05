Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F64525A65B
	for <sophgo@lists.linux.dev>; Sun,  5 Oct 2025 12:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759666118; cv=none; b=CLLgWI2nO98iZPfrx67SZj4yk3/7Iv4ki5XzFxNaO3MFRbNEK5UXgYRsoNbxWPGDkbzOXY5HMEJQgfCg3QG0tRkA/us7mssuuD8Tn44moUeBqAjrK08k3/c5ZeRvlEofBdvP5LLOLEQucmpb0fBdWV92QcLBMupuMpTlrzPeFSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759666118; c=relaxed/simple;
	bh=wyvLuY5n+tvnuGwyGp7qNTcrqSENQNXuYBiM64dU+qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRum+k4wnOIor/yeLG33ofRSehoUEr0UQEPBd23WUQ4J2yKvYD3AQ82adw5SI7FhE6oGLm6NZHisTe9z4/CQX23GzECXcxb9hrNs0zvD1RHukCRyuVMjFXa+IRxipIZyvk9iqYbsLGVHqWPiFdpfxpbaW7790FCpUQaEirmimfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WY8Lq3o4; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WY8Lq3o4"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-78118e163e5so4008806b3a.0
        for <sophgo@lists.linux.dev>; Sun, 05 Oct 2025 05:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759666116; x=1760270916; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n0Iz/V6AwGwcxIZ7A+Dvd5REDaxdSj8jP0Jy7VCRDG8=;
        b=WY8Lq3o4W7a9XUdBu3Q58ZCvlnwnQ6IXuvM5nCwvZmBl+LQWHA7IrtZ3vMuh+Bi1QK
         j8XloHm8SkFU8lyfg3RgYd3jfNEwwwZdA0diCzDwB/YXTFz14Lw6OCVW15tyjISmcTVb
         IEDSMOcK57PqJZiJrqZIunPmW6oAGH6a2uQerIA+yrR8T+3uQsFdZ6fS9irhEwbHrF4o
         mh6h1P/CT5vv4ahC/kQiljlcdJN5/ogYX3IkGUy3lR8mlhLatlNCn5vIos2MeEEkxZQp
         oe1sD2G7/b5ucbEeVasccOhzuLrjTGWiGLGccdQJ8hQBaz/5y19l9v2yh3B3KT2RSxIR
         2VdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759666116; x=1760270916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0Iz/V6AwGwcxIZ7A+Dvd5REDaxdSj8jP0Jy7VCRDG8=;
        b=NJBbHt23oWNOjbnqTFPM1T0OYtc8C56BoXVrk952tdfwRwySpBYTKV3VHgQOk/5EYl
         nTRxAYlA2nkraF9bund2uG5jiiiNXbOIB9DQdt4aZgREVrDi6usZT21pArkAyqBxivbI
         EHP5un17aOA7TSYQn3KU8o/dZDNXEzHbbQUYK7bTDfWA1CZApYbsT4dAfgjId0+2m0Ti
         Ue5iN9zQEwKGo4F9TbrSEN8pUDoZykQsJyb3dV3i1DpPEk5vDjysA2Z6oYeGiTzXFz0U
         GaAqY/6Zy7cW1n1el0nJ7gUzFWUdCuJ0AbGqVXB8nQjqzAMkuZi08j8FDuZg5pixGjNq
         lKnw==
X-Forwarded-Encrypted: i=1; AJvYcCWs/aqCxxUXIQIV4uhRJ6V0xOk6cUy64d+cXtcdOmEu1SEXDhAI8EjTnG3AzS4WQCnnfIF4q3c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJkc1au8YJVLX9IgpTdCwuY2e/lQGeMNtGbUjUNN3n/wCQDeyl
	jr7g+UBjFf8yBMRGJ/pJanNDsZtUA13Tx05p6NLt+5uqntWxDbsKpYa1
X-Gm-Gg: ASbGncucyd1iWA3GOoHJxcsv3hxfcJ+i3DX/nBvCjRH96BCik95HPMf7IPTz1mkRKO2
	ni/gugmYSSLCOZ0TTD5nolPlrVUg642TTYiofAjjiR7xdeyK4FlAKZhMi98IHLF+nCWBVsUDBB3
	RAbZtFBa58RRq36Lxu5lfu1IXSM+3lqYvLr2twkuvegenwuEZaTFxUHKQURGI3XApCB8yBauOPC
	5SQKDedtZAYLI+2CgaFV74yA/mHJ6ZcM75TetOUoS3Kvf3qanq75SP1j7/rXur8w5IQZ/+Iywyz
	osdx/6DvTr47P1A7lTBgxj95NIvsYsOHvPFbxxnbBb3R4fA/T5HM8tHUtr16pdmhgBV5cSM+Eeh
	tcABFtlX965wpLdNj+mP4poC7JBPO3RKir9OrvsgVdfNw6ATK6I+mIeGc
X-Google-Smtp-Source: AGHT+IHBt7NH7TN1KsDxkRb650MBtCb+3uYntKRfpifHFzA5B6tzFUrAE5OSO+EE5Xiib+t6EfWyUA==
X-Received: by 2002:a17:903:190:b0:271:9b0e:54ca with SMTP id d9443c01a7336-28e8d04f303mr174512775ad.13.1759666115849;
        Sun, 05 Oct 2025 05:08:35 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-28e8d1d564csm101640685ad.98.2025.10.05.05.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 05:08:34 -0700 (PDT)
Date: Sun, 5 Oct 2025 20:07:55 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, 
	thomas.bonnefille@bootlin.com, chao.wei@sophgo.com, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <i5ymzikmayu4hmucm46v2mq2qrgdsmm7f6wsfo3rhj4o7pgdnu@ts7uczeb7qxr>
References: <20250927173619.89768-1-josh.milas@gmail.com>
 <20250927173619.89768-3-josh.milas@gmail.com>
 <nkzpfylhxyqf5u3bjlokhe4udgcxohbaanhwuofjzatan3iwio@45ljfquf5sui>
 <aN8isoQpdENTrxNJ@sleek>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aN8isoQpdENTrxNJ@sleek>

On Thu, Oct 02, 2025 at 09:11:14PM -0400, Joshua Milas wrote:
> Hi Inochi,
> 
> > Small suggestion: please ensure the pinctrl is correct, different
> > board may require different configuration.
> 
> Is there a certain way to do that? I have been checking it against
> the board schematic [1]. It shows that it is using UART0 on the
> pins defined in pinctrl-sg2000.h.
> 
> Link: https://github.com/milkv-duo/duo-files/blob/main/duo-s/hardware/duo_s_SCH_v1.1.pdf
> 
> 

Sorry for missing this. A simple way is to dump the vendor configuration
for an example. It should show almost all you want to know. But if you
want to find the best, it is necessary to check the peripheral manual,
and it will tell the typical configuration.

Regards,
Inochi

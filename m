Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC3B347B4
	for <sophgo@lists.linux.dev>; Wed, 19 Mar 2025 00:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742345006; cv=none; b=CIfSKkhteR/wJe7cVpe2n6+Lxyz1RzrNiO6IR2mRurR2tV8TMlU+a8wFao+HhVR2ak7P7kROwRn8Au2xFrM5+M/3OoIF9zkQc16CcXp4YqnWm7kkDWjQy38rny2c4JXUIwStfMlyE/gfe8LKE3VPA4mCJokAw8P9glVADNYTG3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742345006; c=relaxed/simple;
	bh=mHKnTpGJypIO/KKXW/RqTAv+6izqdI2BaKla/V7o8yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDTeEg+8l+HSSg6+H0kKTCKY7tfHQCEF2WWsYKpKHl4URcVZcyGU84FA1bn7nB3O4uyjPrhNSUoYnmJ8qD86ZP3cEnjs40dDNWlvEA6VkgTYb0qPs1j8lcWbRG8rVqg8Ehce5F35Fa+tOBQNIomGlpkkSg7ydx4zqhyl95gggaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfmDb99B; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfmDb99B"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c55b53a459so593536685a.3
        for <sophgo@lists.linux.dev>; Tue, 18 Mar 2025 17:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742345003; x=1742949803; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=109SVVi2V1KBVdBOfvc5rq7XvmKU466K1UBa3pW9LEk=;
        b=JfmDb99BapCDrTM9Jj7J628JdvhVJKSIE+SBDqzSGnwL6hm3GHP0M/SDT4y+yOTZsA
         XaocYFWcKISpsPfxgVCC4tZvcjjMZSj7JmA0xR3aNphMuO8Saxh6BxiMqPg/XrNZrBbD
         CUFXr2nQKRGlOlIcW1RDHyZwl8X47s7G/DQ8zX88KfJMFb8iNMYy6khVkEkApquQ3sCy
         EhYe8i8RDBf4P9/TsSnfdMZr4WiMWO+64rrm7zBx2VutokrfRM3NFzVDr78QJKBNRxkU
         5Jdl+43SbQiFiGaKfRBJb3nH+iVneExR5EOPLzPmky9+cLemFub4zTIwmiqFZJkG3svT
         Q3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742345003; x=1742949803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=109SVVi2V1KBVdBOfvc5rq7XvmKU466K1UBa3pW9LEk=;
        b=jiYs6yvClhv0VpgvP5YgHtV/Pzp1HyWzskwcr8hVNYrPWFAuepRobekOETuQk80zlw
         5DnAXwmjTa+LK9LliYHBZCSB964hHoy2mWjt+2JLmTzkIWfze+tC4nFMfjN2wUbC7jN3
         7aLZM3J9Z7ylfcY3N/9LTTvpWmeAiW4jJupD+Uc/pk/YF1RhyAgPekS3nHB6hCzJTw2B
         dTrSGiJyGP7vl4USj87i8HJJcgl7W4Dqd1orddHDU5ZE1vf6EJbdGOOfp8/xsIDh5nMB
         ywWsdx0wt7dY9EVnY6m/yuWBE+TliJeC62ni/x70lBgXmZcLjUMGGNaaJsWOjsIYYq+1
         d7Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXmVdScINraJPe7UHja5H6nnvTmsag8jEyXpkwRR13+6tAGXl0kIHeu+I2ABpH+o7PGf7ikeNs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzI+e/EVyijGmhQwHFqikiDoGnmKj2LQsRxPNmbAEGOUpjSzyPw
	ZeirND50qKBgv4GsLEmSRDD2wnuEDCuCjFR4JhzZTIIfaFXThrGq
X-Gm-Gg: ASbGncut57XlnXb4yPMe9X4y+HqgnVmF2GmGhGRcjNECQzQTZdPn5XnQvbejfN1KKBH
	jmyKxleKk6sCIzT9TxljdPN6GnMHTtUmwNOQxD+MTKLS+4hrEmuNk+d+L08kcP4+DafJT6ajcqU
	7RZDEHCnELHV3uKRDCqdYKQkVXdB3wZy6vJqdUqw1UQTomVhNLKWXqAQ4APBq4G+H/cJTbi3fts
	6W4wVjIyUjTUkdB7HJnkQ9HUC1UGDB5G2raF9TVFrlJwlCnwcYNBHIVA3addpfk13lhgiZ5Acgt
	aMwG92axEDhGwJ9wa9ep6Ux7cRBxFBk=
X-Google-Smtp-Source: AGHT+IGwPTO0H8oXf2WqT8+evCV+nYPdjITljtORgdkuJm4CD//Y9BewHl+yb7Q89eQYYTTDlZYDdw==
X-Received: by 2002:a05:620a:2a06:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7c5a845e479mr97122385a.37.1742345003657;
        Tue, 18 Mar 2025 17:43:23 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c573d72ceesm786534085a.66.2025.03.18.17.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 17:43:23 -0700 (PDT)
Date: Wed, 19 Mar 2025 08:43:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Yangyu Chen <cyy@cyyself.name>, 
	linux-kernel@vger.kernel.org, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v14 3/3] rtc: sophgo: add rtc support for Sophgo CV1800
 SoC
Message-ID: <gztsdu5p4tzt7emlwiuc3z74f4tfgkclcyrl324prqzp6dqhhf@ezrdmmhvf2nm>
References: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
 <20250315224921.3627852-4-alexander.sverdlin@gmail.com>
 <PN0PR01MB103935B34205CB22313838F34FED92@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN0PR01MB103935B34205CB22313838F34FED92@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>

On Wed, Mar 19, 2025 at 08:31:11AM +0800, Chen Wang wrote:
> Hi, Inochi,
> 
> I see Alexander add "drivers/rtc/rtc-cv1800.c" in "SOPHGO DEVICETREES and
> DRIVERS" of MAINTAINERS, would you like to take this?
> 
> Regards,
> 
> Chen
> 

If it is not covered by our entry. It is fine for me to take it.

Regards,
Inochi

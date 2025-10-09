Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E6619C542
	for <sophgo@lists.linux.dev>; Thu,  9 Oct 2025 01:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759975104; cv=none; b=JtasjcA0cbF+32nZrILbEQU4AAaIsmWFnXS7vMfUa3agNkBf/tioEDM5KqKn9e1dqI2TRCHcS3Y5tHYkcckj4MpNE4KJmLcCTcCfvZsWCcJVNW6tb/W63Amvuv0fuu0eS8DbZxkK3nLZ143P1OkPDj2tZYt8RPZy0Dz05Htc2j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759975104; c=relaxed/simple;
	bh=Tzv03VmmUGs+LjG3lHQExvBJa815vjqsuRExASSQwn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKMa0Ggl9WfqVBz8uXVTgd9zUy7bMyYg93QZcCJIZ+3782WnoKxcJRTE5V59OIKhv5Zal33IUJuGv7s9NxTyM8D82asbWMqOdFVnZi5jAK1RLrAilTXehCDzLlIdLoW2CQmpoVK9gxUHJoXTpbIbo0iSviEoXOztakxqzaaUJig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9T9RcbN; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9T9RcbN"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-84827ef386aso32362385a.0
        for <sophgo@lists.linux.dev>; Wed, 08 Oct 2025 18:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759975101; x=1760579901; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tzv03VmmUGs+LjG3lHQExvBJa815vjqsuRExASSQwn8=;
        b=j9T9RcbN3m5ScpCNS2ejbYABizz79usiVyxcp5f65imCBcNYN+TtKYigHxgBkn/pKC
         DdXecffPlpR8lT41BLm0hegHq4oJI1bpsBId3xAgqebh9aRH6ZDdMFejhDj93b00SM7q
         5SSAa9DASJC3Wbt5YssiiRWqChQDSb9QiEBO3Y1tn/2iuwcd6XC2i2N7uEYpSyPwVH/J
         Bcr3Op8MV9tcNC9bEQqMRFzIeT3wbQHiykynFBvTO5RpJFT2x9I1MxswkGxODhaCPF4m
         ZxMIPbCjBfy2whw7u3TNjV26ULnGAx9POx+ocS1yDvKoqSKfaMqhleGJJdhPSC9gAcYU
         vheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975101; x=1760579901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tzv03VmmUGs+LjG3lHQExvBJa815vjqsuRExASSQwn8=;
        b=IzagObYcg7LfPlVbguvKDekdT2V4jlgl8+ft3X2Uco2DqaKwK8OO03qrPbXDrKqsTe
         HdzjBjg3v8LGOSaKk6QRsuKrYS2lLbiuUqiE0jfScqH6gJ5uZXytYW1Gx3HkL+nu+7Nm
         DUCHqr/C2ThOXIZZvgwsuN2qcBI/2eP4e4J8w7qw4mpTpcxtIFWZHde1XjNuTPW6G9IY
         vOn3NaS57HVfIM13kBD7GvytZKImsNB+gztFFZwZSiEXuKiA76gYhnOrZsls09DMBWwq
         acjaNQSr0WaRH9rLItuNerIbiygCORfbz9gt7MT2xYXBSrFHXQuzTlI1ruaCuLHr/jqW
         K7jw==
X-Forwarded-Encrypted: i=1; AJvYcCXAL337b8ai3TIrW77F4+KGGI5AEvAjKCAyyFOVFxLfIg8lWjDfgrPZ7f20qFYlu0TMaBgCTnY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSUn12g6cD7mrSJx8RtkoeuSWJYv9Tu1WfD1J13XgDFK8L+6To
	3LJPyP3btM0rlt6xB5qUZ+2cSR9ZgWDiITK2hz520MQdco+NYltABKrx
X-Gm-Gg: ASbGncvRL4wFmiVkPJaabANwPU5KLDIT/Gir0kjIjw54wMSTwr/MLjYs0DD94qJ1+aL
	nylbz3Hz3a8ocp6j5tt+6jBLG1EEs5UlY5LKn1DhFEEDUwQNc76X3/yCDcSZwGbshxtLubemG7J
	a4w6KHqK3IZEJYsTeACR+aZqDHkqNv5+tE9VK47wrRPjQ6XJDtjbCRcoWDyEIkGuc000PeoZEea
	tcbkKXDjcScaUtuPEASzhxYeKw/dMEc0U0wdpXuw53P5/hnJLcRq6P4OfoEHf5Iwn2vvMSkul5t
	0ndpr/A88OYoiiWU7hw2wX+9D4hGC327IgSJYcDZFrVy3e2ISyJ3SIZYeSHowFoSnbfaCE66hkr
	DhGPmzw7yiOYwIH56TKjVFxsf4LiyDJDG64F/Eg0xih+U1K1sfJCc6AWD8N4MBiS6NuS3qLKFUx
	81H2kp
X-Google-Smtp-Source: AGHT+IG9RnsX45FbvrTJKGSgGRCj53q6iXUyoJNX4P1rwx54YsAmMMd8fwCV/l8tJGcj8EG+HSGqZw==
X-Received: by 2002:a05:620a:28c9:b0:803:7023:36b0 with SMTP id af79cd13be357-883570ce908mr678554585a.74.1759975100966;
        Wed, 08 Oct 2025 18:58:20 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a2273bfbsm105377185a.43.2025.10.08.18.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:58:20 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:58:19 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <aOcWu-yvqwoqcTk3@sleek>
References: <20250927173619.89768-1-josh.milas@gmail.com>
 <20250927173619.89768-3-josh.milas@gmail.com>
 <nkzpfylhxyqf5u3bjlokhe4udgcxohbaanhwuofjzatan3iwio@45ljfquf5sui>
 <aN8isoQpdENTrxNJ@sleek>
 <oxke5yy22pb7nqzlbjsvhcq32xz77pmmxkcrnxr3lxqvhe6cxp@n43f2yngnfcc>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <oxke5yy22pb7nqzlbjsvhcq32xz77pmmxkcrnxr3lxqvhe6cxp@n43f2yngnfcc>

Inochi,

> Weird, I don't see it in riscv build. Can you post your dts here?

It ended up being a driver selection issue on my part. I got the
ARM64 and RICV both woring without the pinctrl config in the dts.
I was also able to get Ethernet working so V2 is hopefully a
maximal config.

Thanks,
- Joshua Milas

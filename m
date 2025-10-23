Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DC5DF72
	for <sophgo@lists.linux.dev>; Thu, 23 Oct 2025 21:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761254329; cv=none; b=l0zZGXCT4Ednq0RjNxX9L+gSpIInhgPmWEjbOJ9ZP8V3GJGDii9sw4nZjnsV5tb4BeGeQAHgAavi7EAoSyfSgMwcmp+egKZiJqru9ZjpZXl9+nxCvnn4+QZ4wpLuVP8/M1iZ4KSTVc5rVO1WKFhXuvTiHg4hbw03BhKr1HRyX/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761254329; c=relaxed/simple;
	bh=zqdMx4BWZftJP4zcBY1Z5+B4QE2/WdMi8WQpGousUlE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nT0qiPwiJ+vItT5/q+C2QvEXSrCSTZqfEbz7Tbmm+GimhcPXSz9YvitQH1sf1WyCTd9FR1IsagBUWNiqrv9rK5TbkmClKAUFlLLAgpTM12gZIC+BSfbkWT4D1w6ZgZeyVBbOkT+W+fnhOaHjRW9JKnmfDJn/qE94K0QeRieqdnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWOxZzfv; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWOxZzfv"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b6d2f5c0e8eso278388666b.3
        for <sophgo@lists.linux.dev>; Thu, 23 Oct 2025 14:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761254325; x=1761859125; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zqdMx4BWZftJP4zcBY1Z5+B4QE2/WdMi8WQpGousUlE=;
        b=UWOxZzfvYOKqdZYtpB+fKZvsz5nj5niTq9Xzer9ao317E4tN/kUfn7orhcNBBMpyyT
         XtuPT2SxW/J/Q07gDEQKDi4C5xGOM4O0pihG1I6HkXWdkOEDGB9ZNicLLb06ghWSxEKC
         9Fd7ifBTMHrMfhqTCFOWd8OgZnbkO/yWaK6hYYhJZ0uADPmhMlOCuB/BRRRTVk5M+Nsd
         s1n8m5guLDTCcFOKThb2zIjVDhGSwOWqny7x8oWhksGAltMVY6tI3Qlr4xi4ePP+v9kz
         7gGVUFDj0aSCaLxMHxtvYqf9nCh58tMVXJnWY55dHRs0wrklhprbJfUFG8RI9Pf1BA+H
         7G+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761254325; x=1761859125;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqdMx4BWZftJP4zcBY1Z5+B4QE2/WdMi8WQpGousUlE=;
        b=vG38IOFFqIHvVPZsf3oJ/W4SBp+byHxpoj6tqnX+gz1hwDlVWCbL2h20ekakEO2JSt
         T6z5gIkr5WnHb9r6J37XOA4l+RSC+ekZg1lAVL+GEokRP535eZF/yuk+KtT21/S423qx
         Py9zetRe4TsGKuNllzfWoYuAjlLfisB+45/GkE9SmccmZhS3CAJ2icHl0gmtG2gt9bAE
         +fIa8ikgdXioKo8MrVQfvjPjMWOsJunW8fME/Gu+8aE2D4/dd5p1xejcj5vQv19EKjIE
         b5yiKoauXRVcXJcg3tR6Cqh5uLcQdUNMW/DcBB4gBQBFdY7NL0UfTeJ1DAqWh/++iEjz
         3meA==
X-Forwarded-Encrypted: i=1; AJvYcCUh6xpvYMs6pyp1jTJeGjONgn0IR1FCijrThmEfSqpVLclHcabcn0o//oGZg8Ktd0mdOjUl9gE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGUxeuBvi79imeKRev6WHrgZzllzxFkfz10k+oRjV0uUwkMrrW
	7W3xyF6byTMTuskY+GZRXFv5rlo1j6k1ZkWXZyO08R+ZdBsV7l0AFQoo
X-Gm-Gg: ASbGncvk8HscgxWh2FSm7EnbIlfzyPsm55PApViKbQ/q6QDcu4RIyIzyh29zyIwIYV+
	oV0BkACp+O5wlxnel13b8E/lN4tU5p9IHdzY+xFIM29yT1LGtYPeSTgg4rjZSTnX28bgzmwQZSF
	3Q1GKxPcZ3LwIKl8fxy9YlxzQBDFblexqxchuUFk3yAFbNaG9cjWvirWZW+gI8ThxG015+lH3eX
	oz6yMiK8UayrAqnYxKfvBzwSvWu7se9JaqB54TK6ohSmBXVZO/mdIz12l4wvUtAfL0iOlbcb9s2
	9yTBDwK9w8PqDhCmnP/CiRvRyxEh9vnVjKWr0UPjrwCgILGn03QFPJV/h5UWOsbeSMqOqWVq4xV
	XjUbJqnvM2KDri1XUXnGbB1MKkEvoberSZvDEut34SfyHWELGo/mVwaesosfK0GawNaJRMd9dnD
	fqa2U5Zto1Xi5EUG4bZ+w+yGth7o9FzDUHpTQKG7j3fy8rDrNjvVNWelwtaABUnkAONuNPN2x2K
	cIezg==
X-Google-Smtp-Source: AGHT+IHwxspN3hm1IKB4H9V+c3IpDHqztSqky8Q11VvJkuMeM6pHmJx5hJJAnadnKwijqWeRSs5KTw==
X-Received: by 2002:a17:907:9415:b0:b6d:2d0b:1ec2 with SMTP id a640c23a62f3a-b6d51c3132amr473461566b.54.1761254324927;
        Thu, 23 Oct 2025 14:18:44 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144ece8sm310786266b.68.2025.10.23.14.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:18:44 -0700 (PDT)
Message-ID: <cd436879784d6843a32c12abff9f9a60d4c6da93.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] riscv: dts: sophgo: Add syscon node for cv18xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Longbin Li <looong.bin@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang	 <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>, Paul Walmsley	 <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Thomas Bonnefille	 <thomas.bonnefille@bootlin.com>, Ze
 Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Thu, 23 Oct 2025 23:18:43 +0200
In-Reply-To: <20251020083838.67522-3-looong.bin@gmail.com>
References: <20251020083838.67522-1-looong.bin@gmail.com>
	 <20251020083838.67522-3-looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Longbin,

On Mon, 2025-10-20 at 16:38 +0800, Longbin Li wrote:
> Add top syscon node and all subdevice nodes for cv18xx series SoC.
>=20
> Co-authored-by: Inochi Amaoto <inochiama@gmail.com>
> Signed-off-by: Longbin Li <looong.bin@gmail.com>

Successfully tested in host mode on Milk-V Duo Module 01 EVB:

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
(please don't forget to take this tag into your v4 if it still will apply)

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv180x.dtsi | 26 +++++++++++++++++++++++=
+++
> =C2=A01 file changed, 26 insertions(+)

--=20
Alexander Sverdlin.

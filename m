Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704F1192D77
	for <sophgo@lists.linux.dev>; Sat, 15 Mar 2025 08:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742028538; cv=none; b=egatlIC8J4ZSuEr0YazjvN4j8s8Iw0cAcxrqxzoZ34SwwtWDRlxDM1u623pwODFJfhPrzybRaL53ISbIghsbrBbA9UeLQRfMJJLBRKvMx+Y5hhfiE14in419Htkh6VrJ0vAwp45WQ5tMv7tOyz1zo94Pa2UxcMTc6DQhGpOK8sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742028538; c=relaxed/simple;
	bh=cnjylHAJmZ101OxlO5ZN/g0D/KVAb26KvZRSU01F7d4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lSj/njvL6xXSAS0MpJCYqrzj8gos+Om4PBbYWsCjS0NTjshrY1ouAApKUTcdjI5AXqxDmmN/4lgGN8oWeJVow2kjNu4SjbAVqZ9G780bw5bOuDmKQ1X3ds53hJBGvcvJXV1HPTGwtkrWSYP9//g664sH9wQ39lC3cumZtBgnp74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elWDfN4P; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elWDfN4P"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0782d787so3124445e9.0
        for <sophgo@lists.linux.dev>; Sat, 15 Mar 2025 01:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742028535; x=1742633335; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9XirSlC1lJUy9SGiwMwdj8q+6uR507R65gB4++UBGzQ=;
        b=elWDfN4P6AZiqR9EdngdFNP9etM4iEuxKw360/YYFqJe+dga2PXHoh1R4GoU/4AaJD
         MwV903TeCzi8sVah5xlEfr2HwZK5Dxdo/se1g+gMPBqd9DEsi6Re0fm67eNN69+MxjNu
         o23QTSmgKx8HcIkfgl5p8scyfJv4ydTOqlzXZHphlCWmSJFarUaE69+2ulVOAH0K8hki
         jayHEZAt44yKZkmrIKE9bbdl8wiXE7nxygCHNmPhOa0LC7EVHx/E4usODVa1ytCgUdr4
         voWn9RIOK6LnQhgqgFTsqXpRuCX5m8SvI1pCWN8Lt4OET476Ec/SYUPhqMM/XrcU0bKI
         sdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742028535; x=1742633335;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9XirSlC1lJUy9SGiwMwdj8q+6uR507R65gB4++UBGzQ=;
        b=Wa9dCo6J4HhARQCgvDmZIJOgoeX2auwp8gRLhiS53xB04/Mro2e8N04Dv/534WOJYo
         uaz503vmkolHN+JpdwQZG5hxsu7531wlywR5Q+ngCTLOpSHgrbfeJgG6cTvEiS/IBIHU
         EWDR2NpTwI3IWRyeDQrt7FAruL1djOEoijDF4N3L6QtNQlOt+i3BAVXw5sO1cabGi8Ln
         uFry17p1vxE7O9vVk7x9LGlfsyzBtQxCpwBg4zDe91clMhdGYNUrmkqE7AC5ICIpAfzl
         wD9oIpv3UtKjKDvSBsS1nRSpOhpsltThZEzZgMBQ2A3VracxKwpQMXGKnGJaVf/FoTpM
         Ivpw==
X-Forwarded-Encrypted: i=1; AJvYcCVC1ew0HKSvs2Lqsj4208ADRPHn+byqndOre0H1R2iGDWCTT4iCH+bVPBl5YVhvmUjBHd7yti0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXl7PZ7x5Z8FU3HoRD3MwCVTo5zzg2zZYKhvmphktQLJASED1e
	KxVx5oT4HW4QrWYfiA8S2ILc43yP+yQEpOrYRBxSgJx2aQ/vQfZw
X-Gm-Gg: ASbGncvgS6F4MW2YvjOdiSu9/h5sIM7551LVkwIfGkWVwUm4FAPmSN+e4dZliZcfHJL
	lfFcP3QmznryiG1O22+LjurgJahZU3d+T8FXYcYfKSR+ILcogvsdOjblF6yZRV9D9k82wjYQ9Op
	qr20zc++HRep0Il86Rw46j2C65ZVn6ZTZryYHfUG1eVOJRFwBcl9c51uMH81WF0yIL2rA9o6KWS
	PoZhzqL89h73lS3f3pkaIIO43PuO/OxdY3qVxAndUDV57Pz3T/RmJjP+WlcwOgQ41u+FoL1zilu
	yud0SwfL530S1fYmGeeiVpL7EW6YJJKAivhZjPlhejLXgSOwF6qTUz2dgGyBSg==
X-Google-Smtp-Source: AGHT+IEnlh0fk8XAAJTsh3EgMusKIJ4eBIzMXzyjrW7ZWcsRwEFBnmtJMkoF/+jsIlyvCz+lDXZWkg==
X-Received: by 2002:a05:600c:4f46:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-43d1ed0ea8dmr74052935e9.31.1742028534404;
        Sat, 15 Mar 2025 01:48:54 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe2a263sm43114995e9.22.2025.03.15.01.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 01:48:53 -0700 (PDT)
Message-ID: <fa218150facca3f1756b7df055f6e0e67130ebe2.camel@gmail.com>
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>, 	sophgo@lists.linux.dev, devicetree@vger.kernel.org,
 linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Sat, 15 Mar 2025 09:48:52 +0100
In-Reply-To: <PN0PR01MB10393BB0FDD18288E5FB18E92FEDD2@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
	 <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
	 <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
	 <PN0PR01MB10393BB0FDD18288E5FB18E92FEDD2@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Chen!

On Sat, 2025-03-15 at 09:11 +0800, Chen Wang wrote:
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -22354,6 +22354,7 @@ L:	sophgo@lists.linux.dev
> > > =C2=A0=C2=A0 W:	https://github.com/sophgo/linux/wiki
> > > =C2=A0=C2=A0 T:	git https://github.com/sophgo/linux.git
> > > =C2=A0=C2=A0 S:	Maintained
> > > +F:	drivers/soc/sophgo/cv1800-rtcsys.c
> > Please change to the drivers/soc/sophgo/.
> > We should maintain all files under this.
>=20
> In addition to what Inochi mentioned, please add the following line:
>=20
> F:=C2=A0=C2=A0=C2=A0 Documentation/devicetree/bindings/soc/sophgo/

Isn't it already covered by the existing "N:	sophgo" entry?

--=20
Alexander Sverdlin.

